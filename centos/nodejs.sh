#!/bin/bash

CMD="nodejs npm"

DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
. "$DIR/lib.sh"

install ${CMD}