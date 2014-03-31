package main

import (
    "log"
    "errors"
    "database/sql"
    "crypto/rand"
    "math/big"
    _ "github.com/go-sql-driver/mysql"
)

type Database struct {
    DB                      *sql.DB
    GameStateQuery          *sql.Stmt
    PlayerHandQuery         *sql.Stmt
    PlayerCountQuery        *sql.Stmt
    PlayersQuery            *sql.Stmt
    PlayCardQuery           *sql.Stmt
    UpdateHandQuery         *sql.Stmt
    RecordRoundQuery        *sql.Stmt
    NewRoundQuery           *sql.Stmt
    DrawWhiteCardQuery      *sql.Stmt
    DrawBlackCardQuery      *sql.Stmt
    AuthenticationQuery     *sql.Stmt
    JudgeQuery              *sql.Stmt
    CardPlayedByQuery       *sql.Stmt
    GamesQuery              *sql.Stmt
    InPlayPileQuery         *sql.Stmt
    CreatePlayerQuery       *sql.Stmt
    LookupPlayerQuery       *sql.Stmt
    LookupPlayerByAuthQuery *sql.Stmt
    PlayerJoinQuery         *sql.Stmt
    PlayerIsInGameQuery     *sql.Stmt
    CreateGameQuery         *sql.Stmt
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
    db.PlayerHandQuery, err = db.DB.Prepare("SELECT CardID FROM PlayerHand WHERE PlayerID = ? AND GameID = ? AND RoundPlayed = 0")
    if err != nil {
        log.Fatal(err)
    }
    db.PlayersQuery, err = db.DB.Prepare("SELECT PlayerID FROM PlayersInGame WHERE GameID = ?")
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
    db.InPlayPileQuery, err = db.DB.Prepare("SELECT CardID FROM CardInHand CROSS JOIN Game WHERE RoundPlayed = Game.CurrentRoundNumber AND GameID = ? AND Game.ID = GameID")
    if err != nil {
        log.Fatal(err)
    }
    db.GamesQuery, err = db.DB.Prepare("SELECT ID, Name FROM Game")
    if err != nil {
        log.Fatal(err)
    }
    db.CreatePlayerQuery, err = db.DB.Prepare("INSERT INTO Player (AuthToken, Name) VALUES( ?, ? )")
    if err != nil {
        log.Fatal(err)
    }
    db.LookupPlayerQuery, err = db.DB.Prepare("SELECT * FROM Player WHERE ID = ?")
    if err != nil {
        log.Fatal(err)
    }
    db.LookupPlayerByAuthQuery, err = db.DB.Prepare("SELECT * FROM Player WHERE AuthToken = ?")
    if err != nil {
        log.Fatal(err)
    }
    db.PlayerJoinQuery, err = db.DB.Prepare("INSERT INTO PlayersInGame VALUES ( ?, ?, ? )")
    if err != nil {
        log.Fatal(err)
    }
    db.PlayerIsInGameQuery, err = db.DB.Prepare("SELECT PlayerID FROM PlayersInGame WHERE PlayerID = ? AND GameID = ?")
    if err != nil {
        log.Fatal(err)
    }
    db.CreateGameQuery, err = db.DB.Prepare("INSERT INTO Game (Name, CurrentRoundNumber, CurrentBlackCard) VALUES (?, 1, ?)")
    if err != nil {
        log.Fatal(err)
    }
}

func (db * Database) Deinit() {
    db.DB.Close()
}

func (db *Database) PlayCard(cardID uint32, gameID uint32, playerID uint32) error {
    state, err := db.GameStateNoPlayer(gameID)
    _, err = db.PlayCardQuery.Exec(state.RoundNumber, cardID, playerID, gameID)
    return err
}

func (db *Database) DrawCard(gameID uint32, playerID uint32) error {
    state, err := db.GameStateNoPlayer(gameID)
    cardID, err := db.DrawWhiteCard(gameID)
    _, err = db.UpdateHandQuery.Exec(cardID, playerID, gameID, state.RoundNumber)
    return err
}

func (db *Database) RecordRound(roundNumber uint32, winnerID uint32, cardID uint32, gameID uint32) error {
    _, err := db.RecordRoundQuery.Exec(roundNumber, gameID, winnerID, cardID)
    return err
}

func (db *Database) NewRound(gameID uint32) error {
    currentState, err := db.GameStateNoPlayer(gameID)
    blackCardID, err := db.DrawBlackCard(gameID)
    _, err = db.NewRoundQuery.Exec(currentState.RoundNumber + 1, blackCardID, gameID)
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

func (db *Database) InPlayPile(gameID uint32) ([]uint32, error) {
    var cards []uint32

    rows, err := db.InPlayPileQuery.Query(gameID)
    if err != nil {
        return cards, err
    }
    for rows.Next() {
        var card uint32
        rows.Scan(&card)
        cards = append(cards, card)
    }
    return cards, nil
}

func (db *Database) GameStateNoPlayer(gameID uint32) (GameState, error) {

    var state GameState
    var cardID uint32
    err := db.GameStateQuery.QueryRow(gameID).Scan(&state.GameId, &state.RoundNumber, &cardID)
    if err != nil {
        return GameState{}, err
    }

    state.CurrentBlackCard = cardID

    state.PlayerCount, err = db.PlayerCount(gameID)
    if err != nil {
        state.PlayerCount = 0
    }

    state.CurrentJudge, err = db.CurrentJudge(gameID)
    if err != nil {
        state.CurrentJudge = 0
    }

    state.InPlay, err = db.InPlayPile(gameID)
    if err != nil {
        state.InPlay = []uint32{}
    }

    return state, nil
}

func (db *Database) GameStateForPlayer(gameID uint32, playerID uint32) (GameState, error) {

    handRows, err := db.PlayerHandQuery.Query(playerID, gameID)
    if err != nil {
        return GameState{}, err
    }

    var cards []uint32
    for handRows.Next() {
        var card uint32
        handRows.Scan(&card)
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
        var gameName string
        gameRows.Scan(&gameID, &gameName)

        games = append(games, NewGame(gameID, gameName))
    }

    return games, nil
}

func (db* Database) CreatePlayer(name string) (PlayerInfoMessage, error) {

    authBigInt, err := rand.Int(rand.Reader, big.NewInt(2147483647))
    if err != nil {
        log.Fatal(err)
    }
    auth := uint32(authBigInt.Uint64())

    res, err := db.CreatePlayerQuery.Exec(auth, name)

    if err != nil {
        return PlayerInfoMessage{}, err
    }

    lastInsert, err := res.LastInsertId()
    if err != nil {
        return PlayerInfoMessage{}, err
    }

    var player PlayerInfoMessage
    player.PlayerAuthId = auth
    player.PlayerName = name
    player.PlayerId = uint32(lastInsert)


    return player, nil
}

func (db *Database) LookupPlayer(playerID uint32) (PlayerInfoMessage, error) {
    var player PlayerInfoMessage
    err := db.LookupPlayerQuery.QueryRow(playerID).Scan(&player.PlayerId, &player.PlayerName, &player.PlayerAuthId)

    if err != nil {
        return PlayerInfoMessage{}, err
    }

    return player, nil
}

func (db* Database) PlayerJoin(playerID uint32, gameID uint32, turnOrder uint32) (error) {

    _, err := db.PlayerJoinQuery.Exec(playerID, gameID, turnOrder)

    return err
}

func (db* Database) IsPlayerInGame(playerID uint32, gameID uint32) (bool, error) {

    err := db.PlayerIsInGameQuery.QueryRow(playerID, gameID).Scan(&playerID)
    if err == sql.ErrNoRows {
        return false, nil
    }
    if err != nil {
        return false, err
    }

    return true, err
}

func (db* Database) CreateGame(name string) (uint32, error) {

    res, err := db.CreateGameQuery.Exec(name, 459)

    lastInsert, err := res.LastInsertId()

    return uint32(lastInsert), err
}
