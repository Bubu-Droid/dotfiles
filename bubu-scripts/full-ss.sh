#!/usr/bin/env bash

# flameshot full --path "$HOME/Pictures/screenshots"
spectacle -b -f -n -o "$HOME/Pictures/screenshots/$(date '+%Y-%m-%d-%H%M%S')-$(shuf -i 1000-9999 -n 1).png"
xrandr --output "$(xrandr | awk "/ connected/{print \$1; exit}")" --brightness 0.8
sleep 0.25
xrandr --output "$(xrandr | awk "/ connected/{print \$1; exit}")" --brightness 1
