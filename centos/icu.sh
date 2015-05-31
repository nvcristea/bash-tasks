#!/bin/bash

CMD="icu"

DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
. "$DIR/lib.sh"

install ${CMD}