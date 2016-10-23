#!/bin/sh

set -eu

SCRIPT_DIR=$(dirname $0)

docker run --rm -it sercxanto/resume /bin/bash
