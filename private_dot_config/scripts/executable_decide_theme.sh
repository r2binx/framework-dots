#!/bin/sh

daytime=$(date +%H)

if [ $daytime -ge 21 ] || [ $daytime -le 8 ]; then
        ~/.config/scripts/theme_toggle.sh dark
        echo "dark" > /tmp/theme
else
        ~/.config/scripts/theme_toggle.sh light
        echo "light" > /tmp/theme
fi
