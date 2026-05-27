#!/usr/bin/env bash

# Some vars
read -r current_device <"$HOME/.device"

if [ "$current_device" == "desktop" ]; then
  if
    [ "$(cat "$HOME/.config/polybar/config.ini" |
      grep "^override-redirect[[:space:]]*=[[:space:]]*false$" |
      wc -c)" -eq 0 ]
  then
    sed -Ei "s|^override-redirect[[:space:]]*=[[:space:]]*true$|override-redirect = false|" "$HOME/.config/polybar/config.ini"
    sed -Ei "s|^width[[:space:]]*=[[:space:]]*[0-9]*%|width = 100%|" "$HOME/.config/polybar/config.ini"
  else
    sed -Ei "s|^override-redirect[[:space:]]*=[[:space:]]*false$|override-redirect = true|" "$HOME/.config/polybar/config.ini"
    sed -Ei "s|^width[[:space:]]*=[[:space:]]*[0-9]*%|width = 80%|" "$HOME/.config/polybar/config.ini"
  fi

  # Restart i3
  i3-msg restart
fi
