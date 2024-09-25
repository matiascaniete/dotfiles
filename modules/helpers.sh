#! /usr/bin/env bash

error() {
    RED='\033[0;31m'
    NC='\033[0m' # No Color
    printf "${RED}%s${NC}\n" "$1"
}

pipe-error() {
    RED='\033[0;31m'
    NC='\033[0m' # No Color
    while read -r line; do
        icon=$([[ $line != "" ]] && echo " " || echo "")
        printf "${RED}$icon%s${NC}\n" "$line"
    done
}

tabbed() {
    while read -r line; do printf "\t%s\n" "$line"; done
}

# exec 2> >(pipe-error)

echo-header() {
    lolcat -f
}

_module_exists() {
    [[ -f "$MODULES_DIR/$1.sh" ]]
}

_command_exists() {
    command -v "$1" &> /dev/null
}

_run() {
    if _command_exists "_$1"; then
        cmd="_$1"
        shift
        $cmd "$@"

        return
    fi

    if _module_exists "$1"; then
        source "$MODULES_DIR/$1.sh"
        shift
        cmd="_$1"
        shift
        $cmd "$@"

        return
    fi

    error "Module or command [$1] does not exist"
    return 1
}

