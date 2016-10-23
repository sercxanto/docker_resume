#!/bin/bash

set -eu

SCRIPT_DIR=$(dirname $0)

source $SCRIPT_DIR/settings.sh

host_uid=$(id -u)
host_gid=$(id -g)

tmpdir=$(mktemp -d)


baseimage=$tag_prefix:$version
localimage=${tag_prefix}_local:$version

sed -e s%__TAG__%${baseimage}% -e "s/__UID__/1000/" -e "s/__GID__/1000/" \
    $SCRIPT_DIR/step2/Dockerfile_template \
    > $tmpdir/Dockerfile

docker build $tmpdir --tag $localimage
