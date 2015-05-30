#!/bin/bash

SOURCE="${BASH_SOURCE[0]}"
DIR="$( dirname "$SOURCE" )"
SCRIPT="${0##*/}"
EXTENSION=".sh"
CMD=${SCRIPT%$EXTENSION}

function validate
{
    echo "-> VALIDATE"

    if [[ $(which ${CMD}) == */${CMD} ]]; then
        sh ${DIR}/lib.sh errorAlreadyInstalled ${CMD}
        exit 0
    fi
}

function install
{
    echo "-> START"

    wget https://phar.phpunit.de/phpunit.phar
    chmod +x phpunit.phar
    mv phpunit.phar /usr/bin/phpunit
    phpunit --version
}


echo "## Install ${CMD^}"
validate
install
echo "-> FINISH"