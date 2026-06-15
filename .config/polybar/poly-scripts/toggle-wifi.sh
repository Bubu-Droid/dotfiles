#!/usr/bin/env bash

read -r current_device <"$HOME/.device"

if [ "$(nmcli radio wifi | grep "enabled" | wc -c)" -eq 0 ]; then
  nmcli radio wifi on
  sed -Ei "s|interface-type[[:space:]]*=[[:space:]]*[a-zA-Z0-9_]*|interface-type = wireless|g" "$HOME/.config/polybar/modules/network.ini"
else
  nmcli radio wifi off
  sed -Ei "s|interface-type[[:space:]]*=[[:space:]]*[a-zA-Z0-9_]*|interface-type = wired|g" "$HOME/.config/polybar/modules/network.ini"
fi

i3-msg restart
