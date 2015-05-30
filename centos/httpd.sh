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

    yum -y -q install httpd

    chkconfig httpd on
    service httpd start

    chkconfig --list httpd
    service httpd status
}


echo "## Install ${CMD^}"
validate
install
echo "-> FINISH"