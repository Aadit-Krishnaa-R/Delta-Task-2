FROM ubuntu:latest
RUN apt-get update
RUN apt-get install sudo -y
WORKDIR /gamma
COPY scripts .
RUN sudo useradd -s /bin/bash -d /home/HAD -m HAD
CMD tail -f /dev/null
