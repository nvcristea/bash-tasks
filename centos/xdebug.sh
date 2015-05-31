#!/bin/bash

CMD="php-pecl-xdebug"

DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
. "$DIR/lib.sh"

install ${CMD}