package main

import (
    "log"
)

type BlackCard struct {
    ID      uint32
    Value   string
}

type WhiteCard struct {
    ID      uint32
    Value   string
}

type GameState struct {
    GameId          uint32
    RoundNumber     uint32
    CurrentCard     BlackCard
    CurrentJudge    uint32
    PlayerCount     uint32

    Hand        []WhiteCard
}

type Game struct {
    ID              uint32
    broadcasters    map[uint32]*Broadcaster
}

func NewGame(gameID uint32) *Game {
    g := &Game{
        ID: gameID,
        broadcasters : make(map[uint32]*Broadcaster),
    }

    return g
}

func (game *Game) PlayerJoin(db* Database, playerID uint32) {

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

func (game *Game) PlayCard(db *Database, playerID uint32, cardID uint32) {
    db.PlayCard(cardID, game.ID, playerID)
    db.DrawCard(game.ID, playerID)
    game.BroadcastGameStateToPlayer(db, playerID)
}

func (game *Game) PickWinningCard(db *Database, cardID uint32) {
    playerID, err := db.CardPlayedBy(game.ID, cardID)
    if err != nil {
        log.Fatal(err)
    }
    game.PickWinner(db, playerID, cardID)
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