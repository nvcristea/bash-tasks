#!/bin/bash

MYSQL_ROOT_PASS="pass"

declare -A WHICH_MAP=(
    [nodejs]='node'
    [java7]='java'
)

declare -A YUM_INSTALL_MAP=(
    [update]='update'
    [httpd]='httpd'
    [mysql]='mysql'
    [php]='php php-pear php-suhosin php-mysql php-pdo php-intl php-gd php-fpm php-xml php-mcrypt'
    [php55]='--enablerepo=remi php55 php55-php-pear php55-php-intl php55-php-gd php55-php-fpm php55-php-mcrypt'
    [php_pecl_tools]='php-pecl-apc php-pecl-geoip php-pecl-oauth'
    [php_dev_tools]='php-devel pcre-devel'
    [phpmyadmin]='phpmyadmin'
    [xhprof]='php-pecl-xhprof'
    [xdebug]='php-pecl-xdebug'
    [composer]='composer'
    [phpunit]='phpunit'
    [icu]='icu'
    [varnish]='varnish'
    [nodejs]='nodejs npm'
    [tools]='nano wget traceroute htop java7'
    [repo-remi]='repo-remi'
)