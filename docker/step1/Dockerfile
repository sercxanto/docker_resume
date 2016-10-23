FROM node
MAINTAINER Georg Lutz <georg@georglutz.de>
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -yq install npm sudo
RUN groupadd dockergroup &&\
    useradd -g dockergroup -m dockeruser &&\
    sudo -u dockeruser mkdir /home/dockeruser/share
RUN npm install hackmyresume -g

