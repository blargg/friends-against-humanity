package main

func main() {
    var srv Server
    srv.Addr = ":8080"
    srv.RunServer()
}