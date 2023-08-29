#!/bin/sh

read backlight < /sys/class/backlight/intel_backlight/bl_power

    if [ "$backlight" -eq 0 ]; then
        echo 4 > /sys/class/backlight/intel_backlight/bl_power
    else
        echo 0 > /sys/class/backlight/intel_backlight/bl_power
    fi
