#!/bin/bash

CMD="php php-pear php-suhosin php-mysql php-pdo php-intl php-gd php-fpm php-xml php-mcrypt"

DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
. "$DIR/lib.sh"

install ${CMD}