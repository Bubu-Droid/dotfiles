#!/usr/bin/env bash

if [ "$(nmcli radio wifi | grep "enabled" | wc -c)" -eq 0 ]; then
  nmcli radio wifi on
  sed -Ei "s|interface[[:space:]]*=[[:space:]]*[a-zA-Z0-9_]*|interface = wlp2s0|g" "$HOME/.config/polybar/modules/network.ini"
  i3-msg restart
else
  nmcli radio wifi off
  sed -Ei "s|interface[[:space:]]*=[[:space:]]*[a-zA-Z0-9_]*|interface = enp1s0|g" "$HOME/.config/polybar/modules/network.ini"
  i3-msg restart
fi
