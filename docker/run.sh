#!/bin/bash

set -eu

SCRIPT_DIR=$(readlink -f $(dirname $0))

source $SCRIPT_DIR/settings.sh

localimage=${tag_prefix}_local:$version

#     -v $SCRIPT_DIR/share:/home/dockeruser/share \


docker run --rm -it -u dockeruser \
    $localimage /bin/bash
