#!/bin/sh

[ -f /tmp/theme ] && read -r theme </tmp/theme || theme=$([ "$(gsettings get org.gnome.desktop.interface color-scheme)" = "'default'" ] || [ "$(gsettings get org.gnome.desktop.interface color-scheme)" = "'prefer-light'" ] && echo "light" || echo "dark")

if [ "${theme}" = "light" ]; then
	"${XDG_CONFIG_HOME}/scripts/theme_toggle.sh" dark &&
		swaymsg reload &&
		systemctl reload --user swaync.service
else
	"${XDG_CONFIG_HOME}/scripts/theme_toggle.sh" light &&
		swaymsg reload &&
		systemctl reload --user swaync.service
fi
