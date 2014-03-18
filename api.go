package main

import (
    "net/http"
    "log"
)

type PlayerInfoMessage struct {
    PlayerId        uint32
    PlayerAuthId    uint32
    PlayerName      string
}

type CreateGameMessage struct {
    GameId  uint32
}

type GameInfo struct {
    Name    string
    GameId  uint32
}

type AvailableGamesMessage struct {
    Games   []GameInfo
}

type JoinGameMessage struct {
    Success bool
}

type LeaveGameMessage struct {
    Success bool
}

func (srv *Server) HandlePlayerInfoRequest(writer http.ResponseWriter, request *http.Request) {
    WriteResponse(writer, 200, PlayerInfoMessage {
        PlayerId        : 2,
        PlayerAuthId    : 124,
        PlayerName      : "Test",
    })
}

func (srv *Server) HandleCreateGameRequest(writer http.ResponseWriter, request *http.Request) {
    WriteResponse(writer, 200, CreateGameMessage {
        GameId  : 117,
    })
}

func (srv *Server) HandleAvailableGamesRequest(writer http.ResponseWriter, request *http.Request) {
    WriteResponse(writer, 200, AvailableGamesMessage{
        Games : []GameInfo{
           GameInfo {
            Name    : "TESTGAME",
            GameId  : 1,
           },
           GameInfo {
            Name    : "TestGame2",
            GameId  : 124,
           },
           GameInfo {
            Name    : "bob",
            GameId  : 385,
           },
        },
    })
}

func (srv *Server) HandleJoinGameRequest(writer http.ResponseWriter, request *http.Request) {
    state, err := srv.db.GameStateForPlayer(1, 1)
    if err != nil {
        log.Fatal(err)
    }
    WriteResponse(writer, 200, state)
}

func (srv *Server) HandleLeaveGameRequest(writer http.ResponseWriter, request *http.Request) {
    WriteResponse(writer, 200, LeaveGameMessage{
        Success : true,
    })
}

func (srv *Server) HandleTestGameState(writer http.ResponseWriter, request *http.Request) {
    state, err := srv.db.GameStateForPlayer(1, 1)
    if err != nil {
        log.Fatal(err)
    }
    WriteResponse(writer, 200, state)
}

func (srv *Server) HandleTestPlayCard(writer http.ResponseWriter, request *http.Request) {
    err := srv.db.PlayCard(1, 1, 1)
    if err != nil {
        log.Fatal(err)
    }
    err = srv.db.DrawCard(1, 1)
    if err != nil {
        log.Fatal(err)
    }
    state, err := srv.db.GameStateForPlayer(1, 1)
    if err != nil {
        log.Fatal(err)
    }
    WriteResponse(writer, 200, state)
}