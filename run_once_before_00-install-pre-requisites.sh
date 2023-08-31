#!/bin/bash

eval "$(grep "^ID" /etc/os-release)"

set -eu

if [[ $ID == "arch" ]]; then
	sudo pacman -Syu --noconfirm --needed git curl base-devel
	cd "$(mktemp -d)" && git clone https://aur.archlinux.org/yay.git && cd yay
	makepkg -si --noconfirm
elif [[ $ID == "fedora" ]]; then
	sudo dnf upgrade --refresh -y &&
		sudo dnf install -y git curl util-linux kernel-tools
fi
