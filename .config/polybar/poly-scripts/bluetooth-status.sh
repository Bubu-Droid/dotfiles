#!/usr/bin/env bash

if [ "$(bluetoothctl show | grep "Powered: yes" | wc -c)" -eq 0 ]; then
  echo "%{F#66ffffff}"
else
  if [ "$(echo info | bluetoothctl | grep 'Connected' | wc -c)" -eq 0 ]; then
    echo ""
  else
    echo "%{F#2193ff}󰂰"
  fi
fi
