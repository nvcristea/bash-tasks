#!/bin/bash

CMD="php-pecl-apc php-pecl-geoip php-pecl-oauth"

DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
. "$DIR/lib.sh"

install ${CMD}