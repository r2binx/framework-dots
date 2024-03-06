#!/bin/sh

[ -f /tmp/theme ] && read -r theme </tmp/theme || theme=$([ "$(gsettings get org.gnome.desktop.interface color-scheme)" = "'default'" ] || [ "$(gsettings get org.gnome.desktop.interface color-scheme)" = "'prefer-light'" ] && echo "light" || echo "dark")

max_brightness=$(cat /sys/class/backlight/intel_backlight/max_brightness)
actual_brightness=$(cat /sys/class/backlight/intel_backlight/actual_brightness)

brightness=$(echo "($actual_brightness/$max_brightness)*100" | bc -l)

jq --unbuffered --compact-output --arg theme "${theme}" --arg brightness "${brightness}" -n '{"class":$theme, "alt":$theme,"percentage":$brightness|tonumber|floor}'
