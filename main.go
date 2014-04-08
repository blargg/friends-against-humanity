package main

func main() {
    var srv Server
    srv.Addr = ":80"
    srv.RunServer()
}