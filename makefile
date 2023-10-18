.PHONY: build run lint test cross-compile

dependencies:
	go mod download

build:
	go build \
		-o ./out/app \
		./cmd/main.go

run:
	go run ./cmd/main.go

lint:
	golangci-lint run --issues-exit-code 0 --out-format code-climate | jq -c '.[] | select(.severity|contains("major"))'

test:
	go test -v ./internal/...

cross-compile:
	goreleaser --snapshot --rm-dist

docker-build:
	docker build -t go-starter .

docker-run:
	docker run --name go-starter-http -d --restart=always -p 8080:8080 go-starter