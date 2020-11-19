FROM golang:latest

LABEL maintainer="<YoCarBo> 38982184+yocarbo@users.noreply.github.com"
ENV DEBIAN_FRONTEND noninteractive

WORKDIR /scaleway

RUN apt update \
    && apt upgrade -y

# RUN GO111MODULE=on go get -v -u ./...
