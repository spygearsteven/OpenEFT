FROM alpine
WORKDIR /tmp
RUN apk add --no-cache wget tar
ADD https://github.com/spygearsteven/nbis/releases/download/v5.0.0/nbis-linux-amd64.tar.gz nbis-linux-amd64.tar.gz
WORKDIR /build
RUN tar -zxvf /tmp/nbis-linux-amd64.tar.gz -C /build/

FROM ubuntu:20.04

WORKDIR /app

COPY . /app

COPY --from=0 /build /app/build

ENV PATH "$PATH:/app/build/bin"

RUN apt-get update && DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install -y git python3 python3-pip libopenjp2-tools libgl1 libglib2.0-0 libx11-dev
RUN pip3 install -r /app/requirements.txt

EXPOSE 7100
