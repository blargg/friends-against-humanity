package main

type Listener struct {
    Channel chan GameState
    KillChannel chan bool
    Alive bool
}

type Broadcaster struct {
    killChannel chan bool
    broadcastChannel chan GameState
    addListenChannel chan chan GameState
    listeners []Listener
}

func (b *Broadcaster) Listen(listenChannel chan GameState) {
    b.addListenChannel <- listenChannel
}

func (b *Broadcaster) Broadcast(msg GameState) {
    b.broadcastChannel <- msg
}

func (b *Broadcaster) Kill() {
    b.killChannel <- true
}

func (b *Broadcaster) Unsubscribe(listenChannel chan GameState) {
    for i := 0; i < len(b.listeners); i++ {
        if b.listeners[i].Channel == listenChannel {
            b.listeners[i].KillChannel <- false
            b.listeners[i].Alive = false
        }
    }
}

func NewBroadcaster() *Broadcaster {
    b := &Broadcaster{
        killChannel: make(chan bool, 0),
        broadcastChannel: make(chan GameState, 0),
        addListenChannel: make(chan chan GameState, 0),
        listeners: make([]Listener, 0),
    }

    go func() {
        for {
            select {
            case listenChannel := <-b.addListenChannel:
                listener := Listener{
                    Channel: listenChannel,
                    KillChannel: make(chan bool, 1),
                    Alive: true,
                }
                b.listeners = append(b.listeners, listener)
            case msg := <-b.broadcastChannel:
                for _, listener := range(b.listeners) {
                    select {
                        case listener.Channel <- msg:
                            break
                        case listener.Alive = <- listener.KillChannel:
                            break
                    }
                }
                // clear out dead listeners
                for i := 0; i < len(b.listeners); i++ {
                    if !b.listeners[i].Alive { 
                        b.listeners = append(b.listeners[:i], b.listeners[i+1:]...)
                        i--
                    }
                }
                break
            case <-b.killChannel:
                break
            }
        }
    }()

    return b
}