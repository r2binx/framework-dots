#!/usr/bin/env bash

[ -f /tmp/theme ] && read -r theme </tmp/theme || theme=$([ "$(gsettings get org.gnome.desktop.interface color-scheme)" = "'default'" ] && echo "light" || echo "dark")

if [ "${theme}" = "light" ]; then
	~/.config/scripts/theme_toggle.sh dark && swaymsg reload
	# && ~/.config/waybar/launch_waybar.sh & disown
else
	~/.config/scripts/theme_toggle.sh light && swaymsg reload
	# && ~/.config/waybar/launch_waybar.sh & disown
fi
