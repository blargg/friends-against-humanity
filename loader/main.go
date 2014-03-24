package main

import (
    "fmt"
    "io/ioutil"
    "encoding/json"
    "database/sql"
    _ "github.com/go-sql-driver/mysql"
)

func main() {
    baseExp := "Base";

    raw, err := ioutil.ReadFile("cards.js")
    var f []map[string]interface{}

    if err != nil {
        fmt.Println(err)
    }

    err = json.Unmarshal(raw, &f)
    if err != nil {
        fmt.Println(err)
    }

    db, err := sql.Open("mysql", "root:@tcp(localhost:3306)/FriendsAgainstHumanity")
    defer db.Close()
    tx, err := db.Begin()
    if err != nil {
        fmt.Println(err)
    }
    insertWhiteCard, err := tx.Prepare("INSERT INTO WhiteCard (ID) VALUES (?);")
    insertBlackCard, err := tx.Prepare("INSERT INTO BlackCard (ID, NumAnswers) VALUES (?, ?);")

    for _, m := range f {

        id := int(m["id"].(float64))
        t := m["cardType"].(string)
        text := m["text"].(string)
        numAns := int(m["numAnswers"].(float64))
        exp := m["expansion"].(string)

        if exp != baseExp {
            continue;
        }

        fmt.Printf("got: id = %d, type = %s, text = %s, numAns = %d\n", id, t, text, numAns)

        if t == "A" {
            _, err = insertWhiteCard.Exec(id)
            if err != nil {
                fmt.Println(err)
            }
        } else {
            _, err = insertBlackCard.Exec(id, numAns)
            if err != nil {
                fmt.Println(err)
            }
        }
    }

    tx.Commit()

}
