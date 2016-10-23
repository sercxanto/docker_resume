FROM node
MAINTAINER Georg Lutz <georg@georglutz.de>
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get -yq --no-install-recommends install npm sudo wkhtmltopdf
RUN groupadd dockergroup &&\
    useradd -g dockergroup -m dockeruser &&\
    sudo -u dockeruser mkdir /home/dockeruser/share
RUN npm install hackmyresume resume-cli -g

