package main
import "net/http"
import "fmt"

func main() {
    http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
        fmt.Fprintf(w, "<h1>Hello</h1>")
    })

    http.ListenAndServe(":8080", nil)
}
