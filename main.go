package main

func main() {
    var srv Server
    srv.Addr = ":4000"
    srv.RunServer()
}