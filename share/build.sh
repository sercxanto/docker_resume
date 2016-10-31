#!/bin/sh

set -eu

SCRIPT_DIR=$(readlink -f $(dirname $0))

JSON_FILE=$SCRIPT_DIR/input/resume.json
OUT_FOLDER_HACK=$SCRIPT_DIR/output/resume-hack
OUT_FOLDER_CLI=$SCRIPT_DIR/output/resume-cli

mkdir -p $OUT_FOLDER_HACK $OUT_FOLDER_CLI
hackmyresume BUILD $JSON_FILE TO $OUT_FOLDER_HACK/resume.all

cd $(dirname $JSON_FILE)
resume export $OUT_FOLDER_CLI/resume.html
