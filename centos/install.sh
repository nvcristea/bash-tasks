#!/bin/bash

if [ -f config.sh ]; then
    . ./config.sh
    . ./lib.sh
else
    DIR="${BASH_SOURCE%/*}"
    if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
    . "$DIR/config.sh"
    . "$DIR/lib.sh"
fi

if [ ${1} = '--help' ]; then
    echo "Available arguments to call 'install.sh arg' are:"
    for KEY in "${!YUM_INSTALL_MAP[@]}"; do echo ${KEY}; done
    exit 0
fi

if [ -z "${YUM_INSTALL_MAP[${1}]}" ]
    then
        error "-> ${1} not configured to install"
    else
        install ${YUM_INSTALL_MAP[${1}]}
fi