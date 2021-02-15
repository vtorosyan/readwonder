FROM ubuntu:latest

WORKDIR /go/src/app
COPY ./dist/readwonder_linux_arm .

CMD /go/src/app/readwonder_linux_arm
