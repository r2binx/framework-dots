#!/usr/bin/env bash
[ -f /tmp/theme ] && read -r theme </tmp/theme || theme=$([ "$(gsettings get org.gnome.desktop.interface color-scheme)" = "'default'" ] && echo "light" || echo "dark")

is_swaync_ServerExist=$(pgrep -c -x "swaync")
if [ "$is_swaync_ServerExist" != 0 ]; then
	killall swaync
else
	echo "swaync_server not found" >/dev/null 2>&1
fi

SDIR="${HOME}/.config/swaync"

swaync --style "${SDIR}/${theme}.css" &
swaync-client -rs
