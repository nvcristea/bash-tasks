#!/bin/bash

SOURCE="${BASH_SOURCE[0]}"
DIR="$( dirname "$SOURCE" )"
SCRIPT="${0##*/}"
EXTENSION=".sh"
CMD=${SCRIPT%$EXTENSION}
MYSQL_ROOT_PASS="pass"

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

    yum -y -q install mysql mysql-server

    chkconfig mysqld on
    service mysqld start
    /usr/bin/mysqladmin -u root password ${MYSQL_ROOT_PASS}
}


echo "## Install ${CMD^}"
validate
install
echo "-> FINISH"