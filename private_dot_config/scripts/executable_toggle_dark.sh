#!/bin/sh
set -x

[ -f /tmp/theme ] && read theme < /tmp/theme || theme=$(gsettings get org.gnome.desktop.interface color-scheme)

if [ $theme = "'default'" ] || [ $theme = "light" ]; then
        ~/.config/scripts/theme_toggle.sh dark && swaymsg reload
        # && ~/.config/waybar/launch_waybar.sh & disown
else
        ~/.config/scripts/theme_toggle.sh light && swaymsg reload
        # && ~/.config/waybar/launch_waybar.sh & disown
fi
