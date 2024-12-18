#!/usr/bin/env sh

set -eu

has_cmd() {
  command -v "$1" >/dev/null 2>&1

}

if [ ! -f /etc/udev/hwdb.d/99-gsx-1000.hwdb ]; then
  sudo ln -s "${HOME}/.local/share/udev/hwdb.d/99-gsx-1000.hwdb" /etc/udev/hwdb.d/99-gsx-1000.hwdb
fi

if has_cmd flatpak; then
  set -x
  sudo flatpak override --filesystem=xdg-config/gtk-3.0:ro --filesystem=xdg-config/gtk-4.0:ro --filesystem=~/.local/share/themes:ro --filesystem=/usr/share/themes:ro --filesystem=/usr/share/icons:ro
fi
