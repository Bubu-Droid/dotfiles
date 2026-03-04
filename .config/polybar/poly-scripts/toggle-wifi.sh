#!/usr/bin/env bash

read -r current_device <"$HOME/.device"

if [ "$(nmcli radio wifi | grep "enabled" | wc -c)" -eq 0 ]; then
  nmcli radio wifi on
  if [ "$current_device" == "laptop" ]; then
    sed -Ei "s|interface[[:space:]]*=[[:space:]]*[a-zA-Z0-9_]*|interface = wlp2s0|g" "$HOME/.config/polybar/modules/network.ini"
  fi
else
  nmcli radio wifi off
  if [ "$current_device" == "laptop" ]; then
    sed -Ei "s|interface[[:space:]]*=[[:space:]]*[a-zA-Z0-9_]*|interface = enp1s0|g" "$HOME/.config/polybar/modules/network.ini"
  fi
fi

i3-msg restart
