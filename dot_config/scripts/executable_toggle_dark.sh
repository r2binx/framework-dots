#!/bin/dash

[ -f /tmp/theme ] && read -r theme </tmp/theme || theme=$([ "$(gsettings get org.gnome.desktop.interface color-scheme)" = "'default'" ] || [ "$(gsettings get org.gnome.desktop.interface color-scheme)" = "'prefer-light'" ] && echo "light" || echo "dark")

if [ "${theme}" = "light" ]; then
  "${XDG_CONFIG_HOME}/scripts/theme_toggle.sh" dark &&
    "${XDG_CONFIG_HOME}/scripts/sway_reload"
else
  "${XDG_CONFIG_HOME}/scripts/theme_toggle.sh" light &&
    "${XDG_CONFIG_HOME}/scripts/sway_reload"
fi
