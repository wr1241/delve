FROM golang:1.14.2 AS build-env

RUN go get github.com/go-delve/delve/cmd/dlv

FROM debian:buster

EXPOSE 40000

COPY --from=build-env /go/bin/dlv /usr/bin/dlv

ENTRYPOINT ["/usr/bin/dlv", "--listen=:40000", "--headless=true", "--api-version=2", "--accept-multiclient", "exec"]
