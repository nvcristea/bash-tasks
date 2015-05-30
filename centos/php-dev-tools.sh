#!/bin/bash

SOURCE="${BASH_SOURCE[0]}"
DIR="$( dirname "$SOURCE" )"
SCRIPT="${0##*/}"
EXTENSION=".sh"
CMD=${SCRIPT%$EXTENSION}


function install
{
    echo "-> START"

    yum -y php-pecl-xhprof php-pecl-xdebug
    yum -y php-devel pcre-devel phpmyadmin
}


echo "## Install ${CMD^}"
install
echo "-> FINISH"