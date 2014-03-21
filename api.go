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

func (srv *Server) HandleCreatePlayerRequest(writer http.ResponseWriter, request *http.Request) {
    playerName := request.Header.Get("Name")

    player, err := srv.db.CreatePlayer(playerName)

    if err != nil {
        log.Fatal(err)
    }

    WriteResponse(writer, 200, player)
}

func (srv *Server) HandleCreateGameRequest(writer http.ResponseWriter, request *http.Request) {
    gameName := request.Header.Get("Name")
    gameId, err := srv.db.CreateGame(gameName)
    if err != nil {
        log.Fatal(err)
    }

    WriteResponse(writer, 200, CreateGameMessage{ GameId : gameId, })
}

func (srv *Server) HandleAvailableGamesRequest(writer http.ResponseWriter, request *http.Request) {
    games, err := srv.db.GetGames()
    if err != nil {
        log.Fatal(err)
    }

    gameInfos := []GameInfo{}
    for index := range games {
        gameInfo := GameInfo { Name: games[index].Name, GameId: games[index].ID, }
        gameInfos = append(gameInfos, gameInfo)
    }

    WriteResponse(writer, 200, AvailableGamesMessage{
        Games : gameInfos,
    })
}

func (srv *Server) HandleLeaveGameRequest(writer http.ResponseWriter, request *http.Request) {
    WriteResponse(writer, 200, LeaveGameMessage{
        Success : true,
    })
}