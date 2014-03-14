package main

import (
    "net/http"
    "log"
)

type GameStateMessage struct {
    State GameState 
}

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

func HandlePlayerInfoRequest(writer http.ResponseWriter, request *http.Request) {
    WriteResponse(writer, 200, PlayerInfoMessage {
        PlayerId        : 117,
        PlayerAuthId    : 711,
        PlayerName      : "TestPlayer117",
    })
}

func HandleCreateGameRequest(writer http.ResponseWriter, request *http.Request) {
    WriteResponse(writer, 200, CreateGameMessage {
        GameId  : 117,
    })    
}

func HandleAvailableGamesRequest(writer http.ResponseWriter, request *http.Request) {
    WriteResponse(writer, 200, AvailableGamesMessage{
        Games : []GameInfo{
           GameInfo {
            Name    : "TestGame1",
            GameId  : 123,
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

func HandleJoinGameRequest(writer http.ResponseWriter, request *http.Request, db *Database) {
    state, err := db.GameStateForPlayer(1, 1)
    if err != nil {
        log.Fatal(err)
    }
    WriteResponse(writer, 200, GameStateMessage{
        State : state,
    })    
}

func HandleLeaveGameRequest(writer http.ResponseWriter, request *http.Request) {
    WriteResponse(writer, 200, LeaveGameMessage{
        Success : true,
    })      
}