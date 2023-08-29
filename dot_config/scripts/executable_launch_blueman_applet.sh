#!/bin/sh

is_blueman_running=`ps -ef | grep -m1 blueman-applet | grep -v "grep" | wc -l`

if [ "$is_blueman_running" = "1" ]; then
    killall blueman-applet
fi

blueman-applet &

