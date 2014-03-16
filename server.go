package main


import (
    "encoding/json"
    "log"
    "net/http"
    "strings"
    "code.google.com/p/go.net/websocket"
)

const (
    ENDPOINT_GAME_STATE         = "GameState"
    ENDPOINT_PLAYER_INFO        = "PlayerInfo"
    ENDPOINT_CREATE_GAME        = "CreateGame"
    ENDPOINT_AVAILABLE_GAMES    = "AvailableGames"
    ENDPOINT_JOIN_GAME          = "JoinGame"
    ENDPOINT_LEAVE_GAME         = "LeaveGame"
    ENDPOINT_TEST_GAME_STATE    = "TestGameState"
    ENDPOINT_PLAY_CARD          = "TestPlayCard"

)

type Server struct {
    Addr        string

    db          Database
    WSHandler   websocket.Server
    Games       map[uint32]*Game
}

type OKMessage struct {
    OK bool `json:"ok"`
    Message string `json:"message,omitempty"`
}

func WriteResponse(w http.ResponseWriter, status int, v interface{}) {
    w.Header().Add("Content-Type", "application/json")
    w.WriteHeader(status)
    wj := json.NewEncoder(w)
    wj.Encode(v)
}

func (srv *Server) HandleWS(ws *websocket.Conn) {
    id := strings.TrimPrefix(ws.Config().Location.Path, "/")
    log.Println("websocket: ", id)

    killChan := make(chan bool, 1)
    listenChan := make(chan GameState, 1)

    var msg struct {
        GameId      uint32
        PlayerId    uint32
        PlayerAuth  uint32 
        CardId      uint32 
        End         bool
    }

    go func() {
        connected := false
        for {
            if err := websocket.JSON.Receive(ws, &msg); err != nil {
                break
            }

            log.Println(msg)
            authentic, err := srv.db.AuthenticatePlayer(msg.PlayerId, msg.PlayerAuth)
            log.Println("Autheticated")
            if err == nil && authentic {
                if !connected {
                    srv.Games[msg.GameId].PlayerConnect(msg.PlayerId, listenChan)
                    connected = true
                    log.Println("Connected")
                }

                currentJudge, _ := srv.db.CurrentJudge(msg.GameId)
                log.Println("Found Judge")
                if msg.PlayerId == currentJudge {
                    srv.Games[msg.GameId].PickWinningCard(&srv.db, msg.CardId)
                } else {
                    srv.Games[msg.GameId].PlayCard(&srv.db, msg.PlayerId, msg.CardId)
                    log.Println("PlayedCard")
                }
            }
        }
        log.Println("recieve break")
        killChan <- true
    }()

    go func() {
        alive := true
        for alive {
            select {
            case state := <-listenChan:
                if err := websocket.JSON.Send(ws, state); err != nil {
                    break
                }
            case <- killChan:
                alive = false
            }
        }
        log.Println("send break")
        killChan <- true
    }()

    // One of the threads has ended, now we must end
    <-killChan

    // This is to make sure the other goroutine gets the message
    killChan <- true

    log.Println("end websocket :(")
}

func (srv *Server) HandleGET(w http.ResponseWriter, rq *http.Request) {
    id := strings.TrimPrefix(rq.URL.Path, "/")

    switch id {
        case ENDPOINT_PLAYER_INFO:
            srv.HandlePlayerInfoRequest(w, rq)
        case ENDPOINT_CREATE_GAME:
            srv.HandleCreateGameRequest(w, rq)
        case ENDPOINT_AVAILABLE_GAMES:
            srv.HandleAvailableGamesRequest(w, rq)
        case ENDPOINT_JOIN_GAME:
            srv.HandleJoinGameRequest(w, rq)
        case ENDPOINT_LEAVE_GAME:
            srv.HandleLeaveGameRequest(w, rq)
        case ENDPOINT_TEST_GAME_STATE:
            srv.HandleTestGameState(w, rq)
        case ENDPOINT_PLAY_CARD:
            srv.HandleTestPlayCard(w, rq)
        case ENDPOINT_GAME_STATE:
            srv.WSHandler.ServeHTTP(w, rq)
        default:
            WriteResponse(w, 400, OKMessage {
                OK : false,
                Message : "Received Unknown Command",
            })
    }

}

func (srv *Server) HandleUnknown(w http.ResponseWriter, rq *http.Request) {
    WriteResponse(w, 400, OKMessage{
        OK: false,
        Message: "unknown method",
    })
}

func (srv *Server) ServeHTTP(w http.ResponseWriter, rq *http.Request) {
    log.Printf("\x1B[" + "1;32" + "m" +  rq.Method + "\x1B[0m " + rq.RequestURI)
    switch rq.Method {
        case "GET": srv.HandleGET(w, rq)
        default: srv.HandleUnknown(w, rq)
    }
}

func (srv *Server) InitGames() {
    games, _ := srv.db.GetGames()

    srv.Games = make(map[uint32]*Game)
    for index := range games {
        srv.Games[games[index].ID] = games[index]
    }
}

func (srv *Server) RunServer() error {

    srv.db.Init()
    defer srv.db.Deinit()

    srv.InitGames()
    srv.WSHandler = websocket.Server{Handler: func(ws *websocket.Conn) {
        srv.HandleWS(ws)
    }, Handshake: nil}
    var httpSrv http.Server
    httpSrv.Addr = srv.Addr
    httpSrv.Handler = srv
    httpSrv.ListenAndServe()
    return nil
}
