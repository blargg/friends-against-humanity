Friends Against Humanity
========================

Setup
-----

To get started, setup your $GOPATH and run
```
go get github.com/blargg/friends-against-humanity
```
Check inside `$GOPATH/bin` and there should be a build of the server. Run it and go to http://127.0.0.1:8080 to confirm that it is working.

You can type 
```
go build github.com/blargg/friends-against-humanity
```
to rebuild any changes to the project. Inside `$GOPATH/src/github.com/blargg/friends-against-humanity` is where the git repo is stored.

It is a real git repo and you can do your pushing, pulling, and commiting from there. You may need to setup the pushing and pulling because I'm sure `go get` just clones the repo anonymously. You can set this up according to https://help.github.com/articles/adding-a-remote.

See https://code.google.com/p/go-wiki/wiki/GithubCodeLayout for more info.
