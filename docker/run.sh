#!/bin/bash

set -eu

SCRIPT_DIR=$(dirname $0)

source $SCRIPT_DIR/settings.sh

docker run --rm -it $tag_prefix /bin/bash
