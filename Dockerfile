FROM golang:1.24

WORKDIR /app

COPY go.mod ./

RUN go mod download

RUN CGO_ENABLED=0 GOOS=linux go build -o /server

COPY *.go ./

EXPOSE 8080

CMD ["/server"]