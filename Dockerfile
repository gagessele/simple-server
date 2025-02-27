FROM golang:1.22.6

WORKDIR /app

COPY go.mod ./

RUN go mod download

COPY *.go ./

RUN CGO_ENABLED=0 GOOS=linux go build -o /simple-server

EXPOSE 8083

CMD ["/simple-server"]