#!/bin/bash

DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
. "$DIR/lib.sh"
OPT=""

function menu {
cat <<EOF
Vagrant CentOS Helper
=====================
 1 - Restart Apache
 2 - Install PHPUNIT
 3 - Install XDebug
 4 - Install Varnish
 5 - Install Tools
 6 - Install php55
 0 - Quit
---------------------
EOF
while ((OPT != 0));
read -p "Select your main menu option: " OPT
do
    case ${OPT} in
        "1")
            restartHttpd
            menu
            break
            ;;
        "2")
            sh ${DIR}/install.sh phpunit
            menu
            break
            ;;
        "3")
            sh ${DIR}/install.sh xdebug
            menu
            break
            ;;
        "4")
            sh ${DIR}/install.sh varnish
            menu
            break
            ;;
        "5")
            sh ${DIR}/install.sh tools
            menu
            break
            ;;
        "6")
            sh ${DIR}/install.sh repo-remi
            sh ${DIR}/install.sh php55
            menu
            break
            ;;
        "0")
            exit 1
            ;;
        *)
            echo invalid option;;
    esac
done

}

menu