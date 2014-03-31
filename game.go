package main

import (
    "log"
)

type GameState struct {
    GameId              uint32
    RoundNumber         uint32
    CurrentBlackCard    uint32
    CurrentJudge        uint32
    PlayerCount         uint32

    Players             []string
    Hand                []uint32
    InPlay              []uint32
    MultiInPlay         [][]uint32
}

type Game struct {
    ID              uint32
    Name            string
    broadcasters    map[uint32]*Broadcaster
}

func NewGame(gameID uint32, gameName string) *Game {
    g := &Game{
        ID: gameID,
        Name: gameName,
        broadcasters : make(map[uint32]*Broadcaster),
    }

    return g
}

func (game *Game) PlayerJoin(db* Database, playerID uint32) {
    state, err := db.GameStateNoPlayer(game.ID)
    if err != nil {
        log.Fatal(err)
    }

    db.PlayerJoin(playerID, game.ID, state.PlayerCount + 1)
    for i := 0; i < 10; i++ {
        db.DrawCard(game.ID, playerID)
    }
}

func (game *Game) PlayerConnect(playerID uint32, listenChannel chan GameState) {
    broadcaster, ok := game.broadcasters[playerID]
    if !ok {
        broadcaster = NewBroadcaster()
        game.broadcasters[playerID] = broadcaster
    }
    broadcaster.Listen(listenChannel)
}

func (game *Game) BroadcastGameState(db *Database) {
    for playerId, broadcaster := range game.broadcasters { 
        gameState, err := db.GameStateForPlayer(game.ID, playerId)
        if err != nil {
            log.Fatal(err)
        }
        broadcaster.Broadcast(gameState)
    }
}

func (game *Game) BroadcastGameStateToPlayer(db *Database, playerId uint32) {
    gameState, err := db.GameStateForPlayer(game.ID, playerId)
    if err != nil {
        log.Fatal(err)
    }
    game.broadcasters[playerId].Broadcast(gameState)
}

func (game *Game) PlayCards(db *Database, playerID uint32, cardID []uint32) {
    db.PlayCards(cardID, game.ID, playerID)
    db.DrawCard(game.ID, playerID)
    game.BroadcastGameState(db)
}

func (game *Game) PickWinningCard(db *Database, cardID []uint32) {
    if cardID == nil || len(cardID) == 0 {
        return
    }

    playerID, err := db.CardPlayedBy(game.ID, cardID[0])
    if err != nil {
        log.Fatal(err)
    }

    for index := range cardID {
        playerIDComp, err := db.CardPlayedBy(game.ID, cardID[index])
        if err != nil {
            log.Fatal(err)
        }

        if playerIDComp != playerID {
            log.Println("Invalid winning cards")
            return
        }
    }

    game.PickWinner(db, playerID, cardID[0])
}

func (game *Game) PickWinner(db *Database, playerID uint32, cardID uint32) {
    state, err := db.GameStateNoPlayer(game.ID)
    if err != nil {
        log.Fatal(err)
    }
    db.RecordRound(state.RoundNumber, playerID, cardID, game.ID)
    db.NewRound(game.ID)
    game.BroadcastGameState(db)
}