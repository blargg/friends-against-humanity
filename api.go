package main

import (
    "database/sql"
    "log"
    "net/http"
    "strconv"
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
    Name        string
    GameId      uint32
    PlayerCount uint32
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
    playerIDStr := request.FormValue("ID")
    playerID, err := strconv.ParseUint(playerIDStr, 10, 31)
    if err != nil {
        WriteResponse(writer, 400, OKMessage {
            OK : false,
            Message : "Invalid ID",
        })
        return
    }

    player, err := srv.db.LookupPlayer(uint32(playerID))
    player.PlayerAuthId = 0 // Lets not leak the AuthID

    if err == sql.ErrNoRows {
        WriteResponse(writer, 400, OKMessage {
            OK : false,
            Message : "Player with ID Not Found",
        })
        return
    }

    if err != nil {
        log.Fatal(err)
    }

    WriteResponse(writer, 200, player)
}

func (srv *Server) HandleCreatePlayerRequest(writer http.ResponseWriter, request *http.Request) {
    playerName := request.FormValue("Name")

    player, err := srv.db.CreatePlayer(playerName)

    if err != nil {
        log.Fatal(err)
    }

    WriteResponse(writer, 200, player)
}

func (srv *Server) HandleCreateGameRequest(writer http.ResponseWriter, request *http.Request) {
    gameName := request.FormValue("Name")
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
        playerCount, err := srv.db.PlayerCount(games[index].ID)
        
        if err != nil {
            log.Fatal(err)
        }

        gameInfo := GameInfo { 
            Name: games[index].Name, 
            GameId: games[index].ID, 
            PlayerCount: playerCount,
        }
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