# Created by Claudio Heidel
FROM ubuntu:16.04

RUN apt-get update

RUN apt-get install -y nano npm curl

RUN \
  curl -sL https://deb.nodesource.com/setup_8.x | bash && \
  apt-get install -y nodejs && \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927 && \
  echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list && \
  apt-get update && \
  apt-get install -y mongodb-org && \
  mkdir /data && \
  mkdir /data/db

VOLUME ["/data/db"]

COPY mongodb.service.txt /etc/systemd/system/mongodb.service

EXPOSE 27017

CMD ["mongod", "--dbpath=/data/db"]
