FROM golang:1.16 AS builder

WORKDIR /go/src/app

COPY . .

RUN go mod init
RUN go get -v -d
RUN go install -v

RUN go build -o /go/bin/docker

FROM scratch

COPY --from=builder /go/bin/docker /go/bin/alpine
ENTRYPOINT ["/go/bin/alpine"]