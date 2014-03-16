package main

type Broadcaster struct {
    killChannel chan bool
    broadcastChannel chan GameState
    addListenChannel chan chan GameState
    listeners []chan GameState
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

func NewBroadcaster() *Broadcaster {
    b := &Broadcaster{
        killChannel: make(chan bool, 0),
        broadcastChannel: make(chan GameState, 0),
        addListenChannel: make(chan chan GameState, 0),
        listeners: make([]chan GameState, 0),
    }

    go func() {
        for {
            select {
            case listenChannel := <-b.addListenChannel:
                b.listeners = append(b.listeners, listenChannel)
            case msg := <-b.broadcastChannel:
                for _, listener := range(b.listeners) {
                    listener <- msg
                }
            case <-b.killChannel:
                break
            }
        }
    }()

    return b
}