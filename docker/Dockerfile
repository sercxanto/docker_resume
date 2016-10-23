FROM node
MAINTAINER Georg Lutz <georg@georglutz.de>
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -yq install npm &&\
    npm install hackmyresume -g
