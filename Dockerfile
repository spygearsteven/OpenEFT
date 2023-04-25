FROM ubuntu:22.10

WORKDIR /app

COPY . /app

RUN apt-get update && DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get install -y git wget python3 python3-pip libopenjp2-tools cmake libgl1 libglib2.0-0 libx11-dev

EXPOSE 7100
