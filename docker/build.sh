#!/bin/bash

set -eu

SCRIPT_DIR=$(dirname $0)

. $SCRIPT_DIR/settings.sh

docker build $SCRIPT_DIR --tag $tag_prefix
