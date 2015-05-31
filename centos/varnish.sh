#!/bin/bash

CMD="varnish"

DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
. "$DIR/lib.sh"

install ${CMD}