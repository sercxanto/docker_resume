#!/bin/bash

set -eu

SCRIPT_DIR=$(readlink -f $(dirname $0))

source $SCRIPT_DIR/settings.sh

localimage=${tag_prefix}_local:$version

docker run --rm -it -u dockeruser \
    -v $SCRIPT_DIR/share:/home/dockeruser/share \
    -w /home/dockeruser/share \
    $localimage /bin/bash
