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
            sh ${DIR}/phpunit.sh
            menu
            break
            ;;
        "3")
            sh ${DIR}/xdebug.sh
            menu
            break
            ;;
        "4")
            sh ${DIR}/varnish.sh
            menu
            break
            ;;
        "5")
            sh ${DIR}/tools.sh
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