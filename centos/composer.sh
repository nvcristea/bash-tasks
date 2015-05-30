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

    cd /tmp
    curl -sS https://getcomposer.org/installer | php
    mv composer.phar /usr/bin/composer
    chmod +x /usr/bin/composer
    which composer
}


echo "## Install ${CMD^}"
validate
install
echo "-> FINISH"