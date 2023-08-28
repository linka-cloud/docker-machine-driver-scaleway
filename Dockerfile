FROM golang:alpine

WORKDIR /docker-machine-driver-scaleway

COPY go.mod go.sum ./

RUN go mod download

COPY main.go ./
COPY driver ./driver

RUN CGO_ENABLED=0 go build -trimpath -ldflags="-s -w" .

FROM golang:alpine

RUN apk add --no-cache git

WORKDIR /go/src/github.com/docker/machine

RUN git clone --branch=v0.16.2-gitlab.21  https://gitlab.com/gitlab-org/ci-cd/docker-machine .
RUN CGO_ENABLED=0 GO111MODULE=off go build -o docker-machine -trimpath -ldflags="-s -w" ./cmd/docker-machine


FROM alpine

RUN apk add --no-cache ca-certificates

COPY --from=0 /docker-machine-driver-scaleway/docker-machine-driver-scaleway /usr/local/bin/docker-machine-driver-scaleway-v2
COPY --from=1 /go/src/github.com/docker/machine/docker-machine /usr/local/bin/docker-machine

VOLUME /root/.docker/machine

ENTRYPOINT ["docker-machine"]
