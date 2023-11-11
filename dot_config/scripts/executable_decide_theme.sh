#!/bin/sh

daytime=$(date +%H)

if [ $daytime -ge 21 ] || [ $daytime -le 7 ]; then
	$HOME/.config/scripts/theme_toggle.sh dark
	echo "dark" >/tmp/theme
else
	$HOME/.config/scripts/theme_toggle.sh light
	echo "light" >/tmp/theme
fi
