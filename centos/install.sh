#!/bin/bash

DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
. "$DIR/lib.sh"

case ${1} in

    'composer'|'httpd'|'mysql'|'phpunit'|'icu'|'varnish'|'update')
        install ${1}
    ;;

    'php')
        install "php php-pear php-suhosin php-mysql php-pdo php-intl php-gd php-fpm php-xml php-mcrypt"
    ;;

    'php_dev_tools')
        install "php-pecl-xhprof php-devel pcre-devel phpmyadmin"
    ;;

    *)
        error "--> ${1} not configured to install"
#        install $@
    ;;

esac