#!/usr/bin/env bash

# Some vars
read -r current_rice <"$HOME/.rice"
read -r current_wall <"$HOME/.wall"

# List rices
walls=$(find "$HOME/wallpapers/$current_rice/" -mindepth 1 -maxdepth 1 -type f -exec basename {} \; | sort)

# Find current rice
selected_index=-1
index=0
IFS='
'
for wall in $walls; do
  [ "$wall" = "$current_wall" ] && {
    selected_index=$index
    break
  }
  index=$((index + 1))
done
unset IFS

# Show the rofi selection menu.
selected=$(
  IFS='
'
  for wall in $walls; do
    printf "%s\000icon\037%s/wallpapers/%s/%s\n" "$wall" "$HOME" "$current_rice" "$wall"
  done | rofi -dmenu -p "Wallpaper Selector" \
    -theme "$HOME/.config/rofi/selector.rasi" \
    -selected-row "$selected_index"
)

# If a valid option was selected, write the value to the configuration file and change theme.
if [ -n "$selected" ] && [ "$selected" != "$current_wall" ]; then
  echo "$selected" >"$HOME"/.wall
  feh --bg-fill "$HOME/wallpapers/$current_rice/$selected" &

  # Update Polybar theme
  sed -i "$HOME/.config/i3/config" \
    -e "s|\$HOME/wallpapers/$current_rice/.*\.webp|\$HOME/wallpapers/$current_rice/$selected.webp|"

  # Restart i3
  i3-msg restart
fi
