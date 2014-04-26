package main

import (
    "log"
    "errors"
    "sort"
    "database/sql"
    "math/big"
    "math/rand"
    _ "github.com/go-sql-driver/mysql"
    cryptoRand "crypto/rand"
)


type Database struct {
    DB                      *sql.DB
    LabelsQuery             *sql.Stmt
    LabelWeightsQuery       *sql.Stmt
    GameStateQuery          *sql.Stmt
    PlayerHandQuery         *sql.Stmt
    PlayerCountQuery        *sql.Stmt
    TurnCountQuery          *sql.Stmt
    PlayersQuery            *sql.Stmt
    PlayCardQuery           *sql.Stmt
    UpdateHandQuery         *sql.Stmt
    RecordRoundQuery        *sql.Stmt
    NewRoundQuery           *sql.Stmt
    DrawWhiteCardQuery      *sql.Stmt
    DrawBlackCardQuery      *sql.Stmt
    DrawFirstBlackCardQuery *sql.Stmt
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
    GetAIPlayerInGameQuery  *sql.Stmt
    AINotInGameQuery        *sql.Stmt
    CreateGameQuery         *sql.Stmt
    AnswerCountQuery        *sql.Stmt
    HasPlayedCardQuery      *sql.Stmt
    EndGameQuery            *sql.Stmt
    TurnOrderQuery          *sql.Stmt
    WinningCardQuery        *sql.Stmt
    PlayerScoresQuery       *sql.Stmt
}

func (db *Database)Init() {
    var err error
    db.DB, err = sql.Open("mysql", "root:@tcp(localhost:3306)/FriendsAgainstHumanity")

    err = db.DB.Ping()
    if err != nil {
        log.Fatal(err)
    }

    db.LabelsQuery, err = db.DB.Prepare("SELECT label FROM Labels WHERE ID = ?")
    if err != nil {
        log.Fatal(err)
    }
    db.LabelWeightsQuery, err = db.DB.Prepare("SELECT label, weight FROM MaterializedWeights WHERE BlackCardID = ?")
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
    db.TurnCountQuery, err = db.DB.Prepare("SELECT HighestTurnOrder FROM MaxTurnOrder WHERE GameID = ?")
    if err != nil {
        log.Fatal(err)
    }
    db.PlayerHandQuery, err = db.DB.Prepare("SELECT CardID FROM PlayerHand WHERE PlayerID = ? AND GameID = ? AND RoundPlayed = 0")
    if err != nil {
        log.Fatal(err)
    }
    db.PlayersQuery, err = db.DB.Prepare("SELECT PlayerID FROM PlayersInGame WHERE GameID = ? ORDER BY PlayerID")
    if err != nil {
        log.Fatal(err)
    }
    db.TurnOrderQuery, err = db.DB.Prepare("SELECT TurnOrder FROM PlayersInGame WHERE GameID = ? AND PlayerID = ?")
    if err != nil {
        log.Fatal(err)
    }
    db.PlayCardQuery, err = db.DB.Prepare("UPDATE CardInHand SET RoundPlayed = ?, PlayedOrder = ? WHERE CardID = ? AND PlayerID = ? AND GameID = ?")
    if err != nil {
        log.Fatal(err)
    }
    db.UpdateHandQuery, err = db.DB.Prepare("INSERT INTO CardInHand VALUES (?, ?, ?, ?, 0, 0)")
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
    db.DrawFirstBlackCardQuery, err = db.DB.Prepare("SELECT ID FROM BlackCard ORDER BY RAND()")
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
    db.HasPlayedCardQuery, err = db.DB.Prepare("SELECT CardID FROM CardInHand CROSS JOIN Game WHERE RoundPlayed = Game.CurrentRoundNumber AND GameID = ? AND Game.ID = GameID AND PlayerID = ?")
    if err != nil {
        log.Fatal(err)
    }
    db.InPlayPileQuery, err = db.DB.Prepare("SELECT CardID FROM CardInHand CROSS JOIN Game WHERE RoundPlayed = Game.CurrentRoundNumber AND GameID = ? AND Game.ID = GameID ORDER BY PlayerID, PlayedOrder")
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
    db.EndGameQuery, err = db.DB.Prepare("DELETE FROM Game WHERE ID = ?")
    if err != nil {
        log.Fatal(err)
    }
    db.PlayerIsInGameQuery, err = db.DB.Prepare("SELECT PlayerID FROM PlayersInGame WHERE PlayerID = ? AND GameID = ?")
    if err != nil {
        log.Fatal(err)
    }
    db.GetAIPlayerInGameQuery, err = db.DB.Prepare("SELECT PlayerID FROM AI_Players JOIN PlayersInGame ON PlayerID = ID WHERE GameID = ?")
    if err != nil {
        log.Fatal(err)
    }
    db.AINotInGameQuery, err = db.DB.Prepare("SELECT ID FROM AI_Players WHERE (ID) NOT IN (SELECT PlayerID as ID FROM PlayersInGame WHERE GameID = ?)")
    if err != nil {
        log.Fatal(err)
    }
    db.CreateGameQuery, err = db.DB.Prepare("INSERT INTO Game (Name, CurrentRoundNumber, CurrentBlackCard) VALUES (?, 1, ?)")
    if err != nil {
        log.Fatal(err)
    }
    db.AnswerCountQuery, err = db.DB.Prepare("SELECT NumAnswers FROM BlackCard WHERE ID = ?")
    if err != nil {
        log.Fatal(err)
    }
    db.WinningCardQuery, err = db.DB.Prepare("SELECT CardID FROM CardInHand, Round, Game WHERE Game.ID = Round.GameID AND Game.Id = CardInHand.GameId AND CurrentRoundNumber - 1 = RoundNumber AND Game.ID = ? AND WinnerID = PlayerID AND RoundPlayed = RoundNumber ORDER BY PlayedOrder ASC")
    if err != nil {
        log.Fatal(err)
    }
    db.PlayerScoresQuery, err = db.DB.Prepare("SELECT COUNT(RoundNumber) FROM Round RIGHT JOIN (SELECT PlayerID, GameID FROM PlayersInGame WHERE GameID = ?) AS Players ON Players.PlayerID = Round.WinnerID AND Round.GameID = Players.GameID GROUP BY Players.PlayerID ORDER BY Players.PlayerID")
    if err != nil {
        log.Fatal(err)
    }

}

func (db * Database) Deinit() {
    db.DB.Close()
}

func (db *Database) PlayCards(cardID []uint32, gameID uint32, playerID uint32) error {
    state, err := db.GameStateNoPlayer(gameID)
    for index := range cardID {
    _, err = db.PlayCardQuery.Exec(state.RoundNumber, index, cardID[index], playerID, gameID)
    }
    return err
}

func (db *Database) PlayCardsCheck(gameID uint32, playerID uint32, cardID []uint32) {
    alreadyPlayed, err := db.HasPlayedCard(gameID, playerID)
    if alreadyPlayed || err != nil {
        log.Println("Player has already played a card.")
        return
    }
    gameState, err := db.GameStateNoPlayer(gameID)

    answerCount, err := db.AnswerCount(gameState.CurrentBlackCard)
    if err != nil || int(answerCount) != len(cardID) {
        log.Println("Invalid cards played")
        return
    }

    db.PlayCards(cardID, gameID, playerID)
    for i := uint32(0); i < answerCount; i++ {
        db.DrawCard(gameID, playerID)
    }
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

func (db *Database) AnswerCount(cardID uint32) (uint32, error) {
    var count uint32
    err := db.AnswerCountQuery.QueryRow(cardID).Scan(&count)
    return count, err
}

func (db *Database) DrawBlackCard(gameID uint32) (uint32, error) {
    rows, err := db.DrawBlackCardQuery.Query(gameID)
    defer rows.Close();
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

func (db *Database) DrawFirstBlackCard() (uint32, error) {
    rows, err := db.DrawFirstBlackCardQuery.Query()
    defer rows.Close();
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
    defer rows.Close();
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

func (db *Database) TurnCount(gameID uint32) (uint32, error) {
    var count uint32
    err := db.TurnCountQuery.QueryRow(gameID).Scan(&count)
    return count, err
}

func (db *Database) Players(gameID uint32) ([]string, error) {
    rows, err := db.PlayersQuery.Query(gameID)
    defer rows.Close();
    if err != nil {
        return nil, err
    }

    var playerNames []string
    for rows.Next() {
        var playerID uint32
        rows.Scan(&playerID)
        nameRows, err := db.LookupPlayerQuery.Query(playerID)
        defer nameRows.Close();
        if err != nil || !nameRows.Next() {
            log.Fatal(err)
            continue
        }

        var playerName string
        var auth uint32
        nameRows.Scan(&playerID, &playerName, &auth)

        playerNames = append(playerNames, playerName)
    }

    return playerNames, err
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

func (db *Database) HasPlayedCard(gameID uint32, playerID uint32) (bool, error) {
    var cardID uint32
    err := db.HasPlayedCardQuery.QueryRow(gameID, playerID).Scan(&cardID)
    if err != nil {
        return false, nil
    }

    return true, nil
}

func (db *Database) InPlayPile(gameID uint32, playerCount uint32, answerCount uint32) ([]uint32, [][]uint32, error) {
    if playerCount <= 1 {
        return []uint32{}, [][]uint32{}, nil
    }

    // this removes the judge from the count
    playerCount -= 1

    var cards []uint32
    var shuffleCards []uint32
    var multiInPlay [][]uint32

    rows, err := db.InPlayPileQuery.Query(gameID)
    defer rows.Close()
    if err != nil {
        return []uint32{}, [][]uint32{}, err
    }

    shuffleOrder := rand.Perm(int(playerCount))

    for rows.Next() {
        var card uint32
        rows.Scan(&card)
        cards = append(cards, card)
    }

    if len(cards)  < int(playerCount * answerCount) {
        return []uint32{}, [][]uint32{}, nil
    }

    for i := 0; i < int(playerCount); i++ {
        multiInPlay = append(multiInPlay, []uint32{})
        for j := 0; j < int(answerCount); j++ {
            shuffleCards = append(shuffleCards, cards[shuffleOrder[i] * int(answerCount) + j])
            multiInPlay[i] = append(multiInPlay[i], cards[shuffleOrder[i] * int(answerCount) + j])
        }
    }

    return shuffleCards, multiInPlay, nil
}

func (db *Database) PlayerScores(gameID uint32) ([]uint32, error) {
    rows, err := db.PlayerScoresQuery.Query(gameID)
    if err != nil {
        return []uint32{}, err
    }
    defer rows.Close()

    var scores []uint32
    for rows.Next() {
        var score uint32
        rows.Scan(&score)

        scores = append(scores, score)
    }

    return scores, nil
}

func (db *Database) GameStateNoPlayer(gameID uint32) (GameState, error) {

    var state GameState
    var cardID uint32
    err := db.GameStateQuery.QueryRow(gameID).Scan(&state.GameId, &state.RoundNumber, &cardID)
    if err != nil {
        return GameState{}, err
    }
    state.CurrentBlackCard = cardID

    // Find the previous winning card
    winningCardIDs := make([]uint32, 0)
    rows, err := db.WinningCardQuery.Query(gameID)
    if err == nil {
        for rows.Next() {
            var card uint32
            rows.Scan(&card)
            winningCardIDs = append(winningCardIDs, card)
        }
    }
    state.WinningCards = winningCardIDs
    // Find cards in play
    answerCount, err := db.AnswerCount(cardID)
    if err != nil {
        answerCount = 1
    }

    state.PlayerCount, err = db.PlayerCount(gameID)
    if err != nil {
        state.PlayerCount = 0
    }

    state.TurnCount, err = db.TurnCount(gameID)
    if err != nil {
        state.TurnCount = 0
    }

    state.InPlay, state.MultiInPlay, err = db.InPlayPile(gameID, state.PlayerCount, answerCount)
    if err != nil {
        state.InPlay = []uint32{}
    }

    // Find judge
    state.CurrentJudge, err = db.CurrentJudge(gameID)
    if err != nil {
        log.Printf("in game %d, could not find judge\n")
        state.CurrentJudge = 0
    }

    // Find players
    state.Players, err = db.Players(gameID)
    if err != nil {
        state.Players = []string{}
    }

    // Find scores
    state.Scores, err = db.PlayerScores(gameID)

    state.End = false

    return state, nil
}

func (db *Database) GameStateForPlayer(gameID uint32, playerID uint32) (GameState, error) {

    handRows, err := db.PlayerHandQuery.Query(playerID, gameID)
    defer handRows.Close()
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

    state.TurnOrder, err = db.TurnOrder(gameID, playerID)

    return state, nil
}

func (db* Database) GetGames() ([]*Game, error) {
    games := make([]*Game, 0)
    gameRows, err := db.GamesQuery.Query()
    defer gameRows.Close()
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

    authBigInt, err := cryptoRand.Int(cryptoRand.Reader, big.NewInt(2147483647))
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

func (db *Database) TurnOrder(gameID uint32, playerID uint32) (uint32, error) {
    var turnOrder uint32
    err := db.TurnOrderQuery.QueryRow(gameID, playerID).Scan(&turnOrder)

    if err != nil {
        return 0, err
    }

    return turnOrder, nil
}

func (db* Database) PlayerJoin(playerID uint32, gameID uint32, turnOrder uint32) (error) {

    _, err := db.PlayerJoinQuery.Exec(playerID, gameID, turnOrder)

    return err
}

func (db *Database) NewAIForGame(gameID uint32) (uint32, error) {
    rows, err := db.AINotInGameQuery.Query(gameID)
    if err == sql.ErrNoRows {
        log.Println("no more ai players")
        return 0, err
    }
    rows.Next()
    var playerID uint32
    err = rows.Scan(&playerID)
    return playerID, err
}

// adds the next ai not yet joined with a 0 turn order
func (db *Database) AIJoin(gameID uint32) (uint32, error) {
    playerID, err := db.NewAIForGame(gameID)
    if err != nil {
        log.Println("Could not get new AI")
        return playerID, err
    }
    err = db.PlayerJoin(playerID, gameID, 0)
    return playerID, err
}

func (db* Database) EndGame(gameID uint32) (error) {

    _, err := db.EndGameQuery.Exec(gameID)

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

func (db* Database) GetAIPlayers(gameID uint32) ([]uint32, error) {
    aiPlayers := make([]uint32, 0)
    rows, err := db.GetAIPlayerInGameQuery.Query(gameID)
    if err != nil {
        return aiPlayers, err
    }

    for rows.Next() {
        var curID uint32
        if err = rows.Scan(&curID); err != nil {
            return aiPlayers, err
        }
        aiPlayers = append(aiPlayers, curID)
    }
    if err = rows.Err(); err != nil {
        log.Print("GetAIPlayers: ")
        log.Println(err)
        return aiPlayers, err
    }
    return aiPlayers, err
}

func (db* Database) CreateGame(name string) (uint32, error) {

    card, err := db.DrawFirstBlackCard()
    res, err := db.CreateGameQuery.Exec(name, card)

    lastInsert, err := res.LastInsertId()

    return uint32(lastInsert), err
}

func (db *Database) GetWhiteLabels(whiteCardID uint32) map[string]bool {
    labels := make(map[string]bool)
    rows, err := db.LabelsQuery.Query(whiteCardID)
    for rows.Next() {
        var label string
        if err = rows.Scan(&label); err != nil {
            log.Println("GetWhiteLabels err")
        }
        labels[label] = true
    }
    return labels
}

func (db *Database) CardWeight(blackCard uint32, whiteCard uint32) float32 {
    total := float32(1.0)
    labels := db.GetWhiteLabels(whiteCard)
    rows, err := db.LabelWeightsQuery.Query(blackCard)
    if err != nil {
        log.Println("LabelWeightsQuery err")
    }
    for rows.Next() {
        var blabel string
        var weight float32
        if err = rows.Scan(&blabel, &weight); err != nil {
            log.Println("scanning black label weights")
        }
        log.Printf("label = %s, weight = %f\n", blabel, weight)
        _, exists := labels[blabel]
        if exists {
            total *= weight
        } else {
            total *= (1 - weight)
        }
    }

    return total
}

func (db *Database) aiChooseCard(blackCardID uint32, cardIDs []uint32, answercount uint32) []uint32 {
    TaggedList := make([]FloatPair, 0)
    for _, cardID := range cardIDs {
        TaggedList = append(TaggedList, FloatPair{cardID, db.CardWeight(blackCardID, cardID)})
    }
    sort.Sort(sort.Reverse(ByTag(TaggedList)))
    response := make([]uint32, 0)
    for _, pair := range TaggedList {
        response = append(response, pair.data.(uint32))
    }
    return response[:answercount]
}

func (db *Database) AIPlayRound(gameID uint32) {
    players, err := db.GetAIPlayers(gameID)
    if err != nil {
        log.Println("AIPlayRound")
    }
    for _, playerID := range players {
        gamestate, err := db.GameStateForPlayer(gameID, playerID)
        if err != nil {
            log.Println("AIPlayRound")
        }
        cards := gamestate.Hand
        ansCount, err := db.AnswerCount(gamestate.CurrentBlackCard)
        cardsToPlay := db.aiChooseCard(gamestate.CurrentBlackCard, cards, ansCount)
        db.PlayCardsCheck(gameID, playerID, cardsToPlay)
    }
}
