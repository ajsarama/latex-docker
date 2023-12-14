FROM ubuntu

RUN apt-get -y update && apt-get -y install wget perl python3-pygments vim
WORKDIR latex/
COPY ./README.md .
