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
    PreviousWinningCard uint32

    Players             []string
    Scores              []uint32
    Hand                []uint32
    InPlay              []uint32
    MultiInPlay         [][]uint32
    End                 bool
}

type Game struct {
    ID              uint32
    Name            string
    broadcasters    map[uint32]*Broadcaster
    ending          bool
}

func NewGame(gameID uint32, gameName string) *Game {
    g := &Game{
        ID: gameID,
        Name: gameName,
        broadcasters : make(map[uint32]*Broadcaster),
        ending : false,
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

func (game *Game) EndGame(db* Database) {
    game.ending = true
    game.BroadcastGameState(db)
    for key, value := range game.broadcasters {
        value.Kill()
        delete(game.broadcasters, key)
    }
    db.EndGame(game.ID)
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
        gameState.End = game.ending
        if err != nil {
            log.Fatal(err)
        }
        broadcaster.Broadcast(gameState)
    }
}

func (game *Game) BroadcastGameStateToPlayer(db *Database, playerId uint32) {
    gameState, err := db.GameStateForPlayer(game.ID, playerId)
    gameState.End = game.ending
    if err != nil {
        log.Fatal(err)
    }
    game.broadcasters[playerId].Broadcast(gameState)
}

func (game *Game) PlayCards(db *Database, playerID uint32, cardID []uint32) {
    alreadyPlayed, err := db.HasPlayedCard(game.ID, playerID) 
    if alreadyPlayed || err != nil {
        log.Println("Player has already played a card.")
        return
    }
    gameState, err := db.GameStateNoPlayer(game.ID)

    answerCount, err := db.AnswerCount(gameState.CurrentBlackCard)
    if err != nil || int(answerCount) != len(cardID) {
        log.Println("Invalid cards played")
        return
    }

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

    game.PickWinner(db, playerID, cardID[0])
}

func (game *Game) PickWinner(db *Database, playerID uint32, cardID uint32) {
    state, err := db.GameStateNoPlayer(game.ID)
    if err != nil {
        log.Fatal(err)
    }
    db.RecordRound(state.RoundNumber, playerID, state.CurrentBlackCard, game.ID)
    db.NewRound(game.ID)
    game.BroadcastGameState(db)
}