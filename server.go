package main


import (
    "io"
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
    ENDPOINT_LEAVE_GAME         = "LeaveGame"
    ENDPOINT_END_GAME           = "EndGame"
    ENDPOINT_CREATE_PLAYER      = "CreatePlayer"

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
    w.Header().Set("Access-Control-Allow-Origin", "*")
    w.WriteHeader(status)
    wj := json.NewEncoder(w)
    wj.Encode(v)
}

func (srv *Server) HandleWS(ws *websocket.Conn) {
    id := strings.TrimPrefix(ws.Config().Location.Path, "/")
    log.Println("websocket: ", id)

    var auth struct {
        PlayerId uint32   `json:"PlayerId"`
        PlayerAuth uint32 `json:"AuthToken"`
        GameId uint32     `json:"GameId"`
    }

    if err := websocket.JSON.Receive(ws, &auth); err != nil {
        return
    }


    authentic, err := srv.db.AuthenticatePlayer(auth.PlayerId, auth.PlayerAuth)
    if err != nil || !authentic {
        return
    }

    joined, err := srv.db.IsPlayerInGame(auth.PlayerId, auth.GameId)
    if err != nil {
        log.Fatal(err)
    }

    if !joined {
        srv.Games[auth.GameId].PlayerJoin(&srv.db, auth.PlayerId)
    }

    killChan := make(chan bool, 1)
    listenChan := make(chan GameState, 1)

    var msg struct {
        CardId      uint32
        MultiCardId []uint32
    }

    go func() {
        for {

            if err := websocket.JSON.Receive(ws, &msg); err != nil {
                if err == io.EOF {
                    break;
                } else {
                    continue
                }
            }

            currentJudge, _ := srv.db.CurrentJudge(auth.GameId)
            if auth.PlayerId == currentJudge {
                srv.Games[auth.GameId].PickWinningCard(&srv.db, msg.MultiCardId)
            } else {
                srv.Games[auth.GameId].PlayCards(&srv.db, auth.PlayerId, msg.MultiCardId)
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

    srv.Games[auth.GameId].PlayerConnect(auth.PlayerId, listenChan)
    srv.Games[auth.GameId].BroadcastGameStateToPlayer(&srv.db, auth.PlayerId)

    // One of the threads has ended, now we must end
    <-killChan

    // This is to make sure the other goroutine gets the message
    killChan <- true

    srv.Games[auth.GameId].PlayerDisconnect(auth.PlayerId, listenChan)


    log.Println("end websocket :(")
}

func (srv *Server) HandleGET(w http.ResponseWriter, rq *http.Request) {
    id := strings.TrimPrefix(rq.URL.Path, "/")

    switch id {
        case ENDPOINT_PLAYER_INFO:
            srv.HandlePlayerInfoRequest(w, rq)
        case ENDPOINT_AVAILABLE_GAMES:
            srv.HandleAvailableGamesRequest(w, rq)
        case ENDPOINT_GAME_STATE:
            srv.WSHandler.ServeHTTP(w, rq)
        default:
            WriteResponse(w, 400, OKMessage {
                OK : false,
                Message : "Received Unknown Command",
            })
    }
}

func (srv *Server) HandlePOST(w http.ResponseWriter, rq *http.Request) {
    id := strings.TrimPrefix(rq.URL.Path, "/")

    switch id {
        case ENDPOINT_CREATE_GAME:
            srv.HandleCreateGameRequest(w, rq)
        case ENDPOINT_LEAVE_GAME:
            srv.HandleLeaveGameRequest(w, rq)
        case ENDPOINT_END_GAME:
            srv.HandleEndGameRequest(w, rq)
        case ENDPOINT_CREATE_PLAYER:
            srv.HandleCreatePlayerRequest(w, rq)
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
        case "POST": srv.HandlePOST(w, rq)
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
