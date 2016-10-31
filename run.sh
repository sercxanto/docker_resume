#!/bin/bash

set -eu

SCRIPT_DIR=$(readlink -f $(dirname $0))

source $SCRIPT_DIR/settings.sh
source $SCRIPT_DIR/dockerlib.sh

baseimage=${tag_prefix}:$version
localimage=${tag_prefix}_local:$version

if ! is_docker_image_installed $tag_prefix $version; then
    echo "Creating baseimage"
    tmpdir=$(mktemp -d)
    cp $SCRIPT_DIR/Dockerfile_step1 $tmpdir/Dockerfile
    docker build $tmpdir --tag $tag_prefix:$version
    rm -rf $tmpdir
fi

if ! is_docker_image_installed ${tag_prefix}_local $version; then
    echo "Creating local image"
    tmpdir=$(mktemp -d)

    sed -e s%__TAG__%${baseimage}% -e "s/__UID__/1000/" -e "s/__GID__/1000/" \
        $SCRIPT_DIR/Dockerfile_step2_template \
        > $tmpdir/Dockerfile
    docker build $tmpdir --tag $localimage
    rm -rf $tmpdir
fi

echo "Running $localimage"

mkdir -p $SCRIPT_DIR/share

docker run --rm -it -u dockeruser \
    -v $SCRIPT_DIR/share:/home/dockeruser/share \
    -w /home/dockeruser/share \
    $localimage /bin/bash
