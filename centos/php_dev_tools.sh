#!/bin/bash

CMD="php-pecl-xhprof php-devel pcre-devel phpmyadmin"

DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
. "$DIR/lib.sh"

install ${CMD}