package main

type BlackCard struct {
    ID      uint32
    Value   string
}

type WhiteCard struct {
    ID      uint32
    Value   string
}

type GameState struct {
    GameId      uint32
    RoundNumber uint32
    CurrentCard BlackCard
    PlayerCount uint32

    Hand        []WhiteCard
}

func BroadcastGameState(db *Database, gameID uint32) {

}

func PlayCard(db *Database, gameID uint32, playerID uint32, cardID uint32) {
    db.PlayCard(cardID, gameID, playerID)
    db.DrawCard(gameID, playerID)
    BroadcastGameState(db, gameID)
}

func PickWinner(db *Database, gameID uint32, playerID uint32, cardID uint32) {
    state, _ := db.GameStateNoPlayer(gameID)
    db.RecordRound(state.RoundNumber, playerID, cardID, gameID)
    db.NewRound(gameID)
    BroadcastGameState(db, gameID)
}