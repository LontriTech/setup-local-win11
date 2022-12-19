#!/bin/bash

Verbose=1
Version="v1.0.0"

echo_trying() { echo "Trying to $1... "; echo; }

Help() {
    Version
    echo "Fix DNS issue on WSL 2."; echo
    echo "Syntax: fix_dns [-h|v]"
    echo "options:"
    echo "h     Print this Help."
    echo "v     Verbose mode."; echo
}

Version() {
    echo "Script Version: $Version"
}

exec_bash() {
    if [[ $Verbose -eq 0 ]]
    then
        sudo bash --verbose -c "$1"
    else
        sudo bash -c "$1"
    fi
}

remove_resolv_conf() {
    echo_trying "make /etc/resolv.conf not immutable"
    exec_bash "chattr -f -i /etc/resolv.conf"

    echo_trying "remove /etc/resolv.conf"
    exec_bash "rm --force /etc/resolv.conf"
}

replace_resolv_conf() {
    echo_trying "replace /etc/resolv.conf with ../../configs/resolv.conf"
    exec_bash "cat ../../configs/resolv.conf > /etc/resolv.conf"

    echo_trying "make /etc/resolv.conf immutable"
    exec_bash "chattr -f +i /etc/resolv.conf"
}

replace_wsl_conf() {
    echo_trying "replace /etc/wsl.conf with ../../configs/wsl.conf"
    exec_bash "cat ../../configs/wsl.conf > /etc/wsl.conf"
}

main() {
    remove_resolv_conf
    replace_resolv_conf
    replace_wsl_conf
}

while getopts ":vVh" option; do
    case $option in
        v)
            Verbose=0;;
        V)
            Version
            exit;;
        h)
            Help
            exit;;
        \?)
            echo "Error: Invalid option"
            exit;;
    esac
done

main
