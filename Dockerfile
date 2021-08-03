FROM golang:1.16-alpine

WORKDIR /go/src/app

COPY . .

RUN go mod init
RUN go get -v -d
RUN go install -v

CMD ["app"]