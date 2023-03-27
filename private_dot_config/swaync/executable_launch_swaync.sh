#!/bin/bash
[ -f /tmp/theme ] && read theme < /tmp/theme || theme=$([ $(gsettings get org.gnome.desktop.interface color-scheme) = "'default'" ] && echo "light" || echo "dark")

is_swaync_ServerExist=`ps -ef|grep -m 1 'swaync --style *'|grep -v "grep"|wc -l`
if [ "$is_swaync_ServerExist" = "0" ]; then
  echo "swaync_server not found" > /dev/null 2>&1
elif [ "$is_swaync_ServerExist" = "1" ]; then
  killall swaync
fi

SDIR="$HOME/.config/swaync"

swaync --style "$SDIR"/"$theme".css &
swaync-client -rs
