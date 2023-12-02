#!/bin/sh

run() {
    if ! pgrep -f "$1" ;
    then
        "$@"&
    fi
}

run compton
run setxkbmap -layout "us,ru" -option "grp:alt_shift_toggle"
