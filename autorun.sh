#!/bin/sh

run() {
    if ! pgrep -f "$1" ;
    then
        "$@"&
    fi
}

# Required to support window transparency
run compton

# User autostart commands
run dunst
setxkbmap -layout "us,ru" -option "grp:alt_shift_toggle"
setxkbmap -option ctrl:nocaps
run sxhkd
run blueman-applet
run nm-applet
