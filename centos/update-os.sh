#!/bin/bash

SOURCE="${BASH_SOURCE[0]}"
DIR="$( dirname "$SOURCE" )"

function validate {

    echo "-> VALIDATE"

    if [[ "$(whoami)" != 'root' ]]
    then
        sh ${DIR}/lib.sh errorNoRoot
        exit 0
    fi
}

function install {

    echo "-> START"

    yum -y -q update
}

echo "## Update OS"
validate
install
echo "-> FINISH"