#!/bin/bash

function error {

    echo -e "\033[1;31m${1}\033[0m" 1>&2
}

function errorNoRoot {

    error "-> This script require 'root' privilages"
}

function errorAlreadyInstalled {

    error "-> ${1^} already installed at $(which $1)"
}

function validateCommand {

    echo "-> VALIDATE"

    if [[ $(which ${1}) == */${1} ]]; then
        errorAlreadyInstalled ${1}
        exit 0
    fi
}

# call arguments verbatim:
$@