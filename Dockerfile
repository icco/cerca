FROM golang:1.16-alpine

ENV GOPROXY="https://proxy.golang.org"
ENV GO111MODULE="on"

ENV PORT 8272
EXPOSE $PORT

WORKDIR /go/src/cerca

RUN apk add --no-cache git
COPY . .

RUN go build -v -o /go/bin/server .

ENTRYPOINT ["/go/bin/server"]
