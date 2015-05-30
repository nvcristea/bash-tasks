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
    wget http://download.icu-project.org/files/icu4c/53.1/icu4c-53_1-src.tgz
    tar -xvf icu4c-53_1-src.tgz
    cd icu/source/
    ./runConfigureICU Linux
    make
    make install
    make clean
}


echo "## Install ${CMD^}"
validate
install
echo "-> FINISH"