APP_NAME = readwonder
GOOS = linux
GOARCH = arm
GO = GO111MODULE=on go
BINARY_NAME = ${APP_NAME}_${GOOS}_${GOARCH}

.PHONY: build
build:
	rice embed-go
	env GOOS=${GOOS} GOARCH=${GOARCH} GOARM=7 $(GO) build -a -o ./dist/${BINARY_NAME} -tags netgo -ldflags '-s -w'
	rice clean

build-docker: build
	docker build -t vtorosyan/readwonder-api:1.0 .

run-local: build-docker
	docker-compose down -v
	docker-compose up -d

stop-local:
	docker-compose down -v
	rm -r ./dist/${BINARY_NAME}

.PHONY: db
db:
	docker-compose up -d db
