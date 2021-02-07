APP_NAME = readwonder
ARCH = darwin
GO = GO111MODULE=on go
EXTENSION = $(if $(filter ${ARCH},windows),.exe,)
BINARY_NAME = ${APP_NAME}_${ARCH}_amd64${EXT}

.PHONY: build
build:
	$(GO) build -o ./dist/${BINARY_NAME} -tags netgo -ldflags '-w' ./pkg

run-local: build
	READWONDER_PORT=9000 ./dist/${BINARY_NAME}
