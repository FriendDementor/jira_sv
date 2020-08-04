FROM ubuntu:20.04

RUN apt update && apt upgrade -y

RUN apt install wget mariadb-server unzip screen -y

COPY *.sh /

COPY config.sql /

RUN chmod +x /entrypoint.sh

ENTRYPOINT (screen -d -m sh /entrypoint.sh) && sh
