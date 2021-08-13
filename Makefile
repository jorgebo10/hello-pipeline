GO_VERSION := 1.16.7

setup: install-go init-go

install-go:
        wget "https://golang.org/dl/go$(GO_VERSION).darwin-amd64.pkg"
	sudo installer -pkg go$(GO_VERSION).darwin-amd64.pkg -target / 
	rm go$(GO_VERSION).darwin-amd64.pkg

init-go:
	echo 'export PATH=$$PATH:/usr/local/go/bin' >> $${HOME}/.bashrc
	echo 'export PATH=$$PATH:$${HOME}/go/bin' >> $${HOME}/.bashrc

build:
	go build -o api cmd/main.go
