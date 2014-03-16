package main

import (
    "log"
    "errors"
    "database/sql"
    _ "github.com/go-sql-driver/mysql"
)

type Database struct {
    DB                  *sql.DB
    GameStateQuery      *sql.Stmt
    PlayerHandQuery     *sql.Stmt
    PlayerCountQuery    *sql.Stmt
    PlayersQuery        *sql.Stmt
    BlackCardQuery      *sql.Stmt
    WhiteCardQuery      *sql.Stmt
    PlayCardQuery       *sql.Stmt
    UpdateHandQuery     *sql.Stmt
    RecordRoundQuery    *sql.Stmt
    NewRoundQuery       *sql.Stmt
    DrawWhiteCardQuery  *sql.Stmt
    DrawBlackCardQuery  *sql.Stmt
    AuthenticationQuery *sql.Stmt
    JudgeQuery          *sql.Stmt
    CardPlayedByQuery   *sql.Stmt
    GamesQuery          *sql.Stmt
}

func (db *Database)Init() {
    var err error
    db.DB, err = sql.Open("mysql", "root:@tcp(localhost:3306)/FriendsAgainstHumanity")

    err = db.DB.Ping()
    if err != nil {
        log.Fatal(err)
    }

    db.GameStateQuery, err = db.DB.Prepare("SELECT ID, CurrentRoundNumber, CurrentBlackCard FROM Game WHERE ID = ?")
    if err != nil {
        log.Fatal(err)
    }
    db.PlayerCountQuery, err = db.DB.Prepare("SELECT PlayerCount FROM PlayerCount WHERE GameID = ?")
    if err != nil {
        log.Fatal(err)
    }
    db.PlayerHandQuery, err = db.DB.Prepare("SELECT CardID, Value FROM PlayerHand WHERE PlayerID = ? AND GameID = ? AND RoundPlayed = 0")
    if err != nil {
        log.Fatal(err)
    }
    db.PlayersQuery, err = db.DB.Prepare("SELECT PlayerID FROM PlayersInGame WHERE GameID = ?")
    if err != nil {
        log.Fatal(err)
    }
    db.BlackCardQuery, err = db.DB.Prepare("SELECT * FROM BlackCard WHERE ID = ?")
    if err != nil {
        log.Fatal(err)
    }
    db.WhiteCardQuery, err = db.DB.Prepare("SELECT * FROM WhiteCard WHERE ID = ?")
    if err != nil {
        log.Fatal(err)
    }
    db.PlayCardQuery, err = db.DB.Prepare("UPDATE CardInHand SET RoundPlayed = ? WHERE CardID = ? AND PlayerID = ? AND GameID = ?")
    if err != nil {
        log.Fatal(err)
    }
    db.UpdateHandQuery, err = db.DB.Prepare("INSERT INTO CardInHand VALUES (?, ?, ?, ?, 0)")
    if err != nil {
        log.Fatal(err)
    }
    db.RecordRoundQuery, err = db.DB.Prepare("INSERT INTO Round VALUES (?, ?, ?, ?)")
    if err != nil {
        log.Fatal(err)
    }
    db.NewRoundQuery, err = db.DB.Prepare("UPDATE Game SET CurrentRoundNumber = ?, CurrentBlackCard = ? WHERE ID = ?")
    if err != nil {
        log.Fatal(err)
    }
    db.DrawWhiteCardQuery, err = db.DB.Prepare("SELECT CardID FROM WhiteDeck WHERE GameID = ?")
    if err != nil {
        log.Fatal(err)
    }
    db.DrawBlackCardQuery, err = db.DB.Prepare("SELECT CardID FROM BlackDeck WHERE GameID = ?")
    if err != nil {
        log.Fatal(err)
    }
    db.AuthenticationQuery, err = db.DB.Prepare("SELECT AuthToken FROM Player WHERE ID = ? AND AuthToken = ?")
    if err != nil {
        log.Fatal(err)
    }
    db.JudgeQuery, err = db.DB.Prepare("SELECT PlayerID FROM CurrentJudge WHERE GameID = ?")
    if err != nil {
        log.Fatal(err)
    }
    db.CardPlayedByQuery, err = db.DB.Prepare("SELECT PlayerID FROM CardInHand WHERE GameID = ? AND CardID = ?")
    if err != nil {
        log.Fatal(err)
    }
    db.GamesQuery, err = db.DB.Prepare("SELECT ID FROM Game")
    if err != nil {
        log.Fatal(err)
    }
}   

func (db * Database) Deinit() {
    db.DB.Close()
}

func (db *Database) BlackCardForID(cardID uint32) (BlackCard, error) {

    var card BlackCard
    err := db.BlackCardQuery.QueryRow(cardID).Scan(&card.ID, &card.Value)
    if err != nil {
        return BlackCard{}, err
    }

    return card, nil
}

func (db *Database) WhiteCardForID(cardID uint32) (WhiteCard, error) {

    var card WhiteCard
    err := db.WhiteCardQuery.QueryRow(cardID).Scan(&card.ID, &card.Value)
    if err != nil {
        return WhiteCard{}, err
    }

    return card, nil
}

func (db *Database) PlayCard(cardID uint32, gameID uint32, playerID uint32) error {
    state, err := db.GameStateNoPlayer(gameID)
    log.Println("%d playing %d on round %d in game %d", playerID, cardID, state.RoundNumber, gameID)
    _, err = db.PlayCardQuery.Query(state.RoundNumber, cardID, playerID, gameID)
    return err
}

func (db *Database) DrawCard(gameID uint32, playerID uint32) error {
    state, err := db.GameStateNoPlayer(gameID)
    cardID, err := db.DrawWhiteCard(gameID)
    _, err = db.UpdateHandQuery.Query(cardID, playerID, gameID, state.RoundNumber)
    return err
}

func (db *Database) RecordRound(roundNumber uint32, winnerID uint32, cardID uint32, gameID uint32) error {
    _, err := db.RecordRoundQuery.Query(roundNumber, gameID, winnerID, cardID)
    return err
}

func (db *Database) NewRound(gameID uint32) error {
    currentState, err := db.GameStateNoPlayer(gameID)
    blackCardID, err := db.DrawBlackCard(gameID)
    _, err = db.NewRoundQuery.Query(currentState.RoundNumber + 1, blackCardID, gameID)
    return err
}

func (db *Database) DrawBlackCard(gameID uint32) (uint32, error) {
    rows, err := db.DrawBlackCardQuery.Query(gameID)
    if err != nil {
        return 0, err
    }

    if !rows.Next() {
        return 0, errors.New("Black Deck Empty")
    }

    var cardID uint32
    err = rows.Scan(&cardID)
    if err != nil {
        return 0, err
    }

    return cardID, nil
}

func (db *Database) DrawWhiteCard(gameID uint32) (uint32, error) {
    rows, err := db.DrawWhiteCardQuery.Query(gameID)
    if err != nil {
        return 0, err
    }

    if !rows.Next() {
        return 0, errors.New("White Deck Empty")
    }

    var cardID uint32
    err = rows.Scan(&cardID)
    if err != nil {
        return 0, err
    }

    return cardID, nil
}

func (db *Database) PlayerCount(gameID uint32) (uint32, error) {
    var count uint32
    err := db.PlayerCountQuery.QueryRow(gameID).Scan(&count)
    return count, err
}

func (db *Database) Players(gameID uint32) ([]uint32, error) {
    rows, err := db.PlayersQuery.Query(gameID)
    if err != nil {
        return nil, err
    }

    var playerIDs []uint32
    for rows.Next() {
        var playerID uint32
        rows.Scan(&playerID)
        playerIDs = append(playerIDs, playerID)
    }

    return playerIDs, err
}

func (db *Database) AuthenticatePlayer(playerID uint32, playerAuth uint32) (bool, error) {
    var auth uint32
    err := db.AuthenticationQuery.QueryRow(playerID, playerAuth).Scan(&auth)
    if err == sql.ErrNoRows {
        return false, nil
    }
    if err != nil {
        return false, err
    }

    return true, nil
}

func (db *Database) CurrentJudge(gameID uint32) (uint32, error) {
    var judgeID uint32
    err := db.JudgeQuery.QueryRow(gameID).Scan(&judgeID)
    if err != nil {
        return 0, err
    }

    return judgeID, nil
}

func (db *Database) CardPlayedBy(gameID uint32, cardID uint32) (uint32, error) {
    var playerID uint32
    err := db.CardPlayedByQuery.QueryRow(gameID, cardID).Scan(&playerID)
    if err != nil {
        return 0, err
    }

    return playerID, nil
}

func (db *Database) GameStateNoPlayer(gameID uint32) (GameState, error) {

    var state GameState
    var cardID uint32
    err := db.GameStateQuery.QueryRow(gameID).Scan(&state.GameId, &state.RoundNumber, &cardID)
    if err != nil {
        return GameState{}, err
    }

    state.CurrentCard, err = db.BlackCardForID(cardID)
    if err != nil {
        return GameState{}, err
    }

    state.PlayerCount, err = db.PlayerCount(gameID)
    if err != nil {
        return GameState{}, err
    }

    state.CurrentJudge, err = db.CurrentJudge(gameID)
    if err != nil {
        return GameState{}, err
    }

    return state, nil
}

func (db *Database) GameStateForPlayer(gameID uint32, playerID uint32) (GameState, error) {

    handRows, err := db.PlayerHandQuery.Query(playerID, gameID)
    if err != nil {
        return GameState{}, err
    }

    var cards []WhiteCard
    for handRows.Next() {
        var card WhiteCard
        handRows.Scan(&card.ID, &card.Value)
        cards = append(cards, card)
    }

    state, err := db.GameStateNoPlayer(gameID)
    if err != nil {
        return GameState{}, err
    }

    state.Hand = cards
    return state, nil
}

func (db* Database) GetGames() ([]*Game, error) {
    games := make([]*Game, 0)
    gameRows, err := db.GamesQuery.Query()
    if err != nil {
        return games, err
    }

    for gameRows.Next() {
        var gameID uint32
        gameRows.Scan(&gameID)

        games = append(games, NewGame(gameID))
    }

    return games, nil
}