#!/usr/bin/env bash

if [ "$(nmcli radio wifi | grep "enabled" | wc -c)" -eq 0 ]; then
  echo "%{F#66ffffff}󰖪 "
else
  if [ "$(nmcli -t -f active,ssid dev wifi | grep 'yes' | wc -c)" -eq 0 ]; then
    echo "󱚵 "
  else
    echo "%{F#2193ff}󱚻 "
  fi
fi
