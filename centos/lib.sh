#!/bin/bash

function error {

    echo -e "\033[1;31m${1}\033[0m" 1>&2
    return 1
}

function errorNoRoot {

    error "-> This script require 'root' privilages"
    return $?
}

function errorAlreadyInstalled {

    error "-> ${1^} already installed at $(which $1)"
    return $?
}

function validateCommand {

    echo "-> VALIDATE ${1}"

    if [[ $(which ${1}) == */${1} ]]; then
        errorAlreadyInstalled ${1}
        return $?
    fi
}

function validateRoot {

    echo "-> VALIDATE root"

    if [[ "$(whoami)" != 'root' ]]
    then
        errorNoRoot
        return $?
    fi
}


function restartHttpd {

    service httpd restart
}

function validate
{
    local invalidCount=0

    for PACKAGE in $@; do
        if ! [ -z "${WHICH_MAP[${PACKAGE}]}" ]; then PACKAGE=${WHICH_MAP[${PACKAGE}]}; fi
        validateCommand ${PACKAGE}
        if [ $? -eq 1 ]; then
            (( invalidCount +=1 ))
        fi
    done

    if [[ $# -eq ${invalidCount} ]]; then
        exit 0
    fi
}

function install
{
    echo "## Prepare Install: $@"

    case ${1} in

        'composer')
            validate $@

            echo "-> START"
            cd /tmp
            curl -sS https://getcomposer.org/installer | php
            mv composer.phar /usr/bin/composer
            chmod +x /usr/bin/composer
            which composer
        ;;

        'httpd')
            validate $@

            echo "-> START"
            yum -y install httpd

            chkconfig httpd on
            chkconfig --list httpd
            service httpd start
            service httpd status
        ;;

        'mysql')
            validate $@

            echo "-> START"
            yum -y install mysql mysql-server

            chkconfig mysqld on
            service mysqld start
            /usr/bin/mysqladmin -u root password ${MYSQL_ROOT_PASS}
        ;;

        'phpunit')
            validate $@

            echo "-> START"
            wget https://phar.phpunit.de/phpunit.phar
            chmod +x phpunit.phar
            mv phpunit.phar /usr/bin/phpunit
            phpunit --version
        ;;

        'icu')
            echo "-> START"
            cd /tmp
            wget http://download.icu-project.org/files/icu4c/53.1/icu4c-53_1-src.tgz
            tar -xvf icu4c-53_1-src.tgz
            cd icu/source/
            ./runConfigureICU Linux
            make
            make install
            make clean
            php -i | grep ICU
        ;;

        'varnish')
            echo "-> START"
            rpm --nosignature -i http://repo.varnish-cache.org/redhat/varnish-4.0/el6/noarch/varnish-release/varnish-release-4.0-4.el6.noarch.rpm
            yum -y install varnish
        ;;

        'update')
            yum -y update
        ;;

        *)
            validate $@

            echo "-> START"
            yum install -y $@
        ;;

    esac

    echo "-> FINISH"
}