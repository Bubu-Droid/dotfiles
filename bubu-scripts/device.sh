#!/usr/bin/env bash

# Some vars
read -r current_device <"$HOME/.device"

# List devices
devices=$(find "$HOME/bubu-scripts/devices/" -mindepth 1 -maxdepth 1 -type d -exec basename {} \; | sort)

# Find current device
selected_index=-1
index=0
IFS='
'
for device in $devices; do
  [ "$device" = "$current_device" ] && {
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
  for device in $devices; do
    printf "%s\000icon\037%s/bubu-scripts/devices/%s/icon.png\n" "$device" "$HOME" "$device"
  done | rofi -dmenu -p "Device Selector" \
    -theme "$HOME/.config/rofi/selector.rasi" \
    -selected-row "$selected_index"
)

# If a valid option was selected, write the value to the configuration file and change theme.
if [ -n "$selected" ] && [ "$selected" != "$current_device" ]; then
  echo "$selected" >"$HOME"/.device

  if [ "$selected" == "desktop" ]; then
    # Update Alacritty config
    sed -Ei "s|size[[:space:]]*\=[[:space:]]*[0-9]+|size = 12|g" "$HOME/.config/alacritty/alacritty.toml"

    # Update GTK config
    sed -Ei "s|gtk-font-name=[a-zA-Z0-9_[:space:]]*|gtk-font-name=Inter 11|g" "$HOME/.config/gtk-3.0/settings.ini"
    sed -Ei "s|gtk-font-name=[a-zA-Z0-9_[:space:]]*|gtk-font-name=Inter 11|g" "$HOME/.config/gtk-4.0/settings.ini"

    # Update i3 config
    sed -Ei "s|gaps inner [0-9]+|gaps inner 10|g" "$HOME/.config/i3/config"
    sed -Ei "s|gaps outer [0-9]+|gaps outer 5|g" "$HOME/.config/i3/config"
    sed -Ei "s|[#[:space:]]*gaps top [0-9]+|gaps top 80|g" "$HOME/.config/i3/config"

    # Update picom config
    sed -Ei "s|corner-radius[[:space:]]*\=[[:space:]]*[0-9]+$|corner-radius = 20|" "$HOME/.config/picom/picom.conf"

    # Update polybar config
    sed -Ei "s|override-redirect[[:space:]]*\=[[:space:]]*[a-zA-Z]+$|override-redirect = true|" "$HOME/.config/polybar/config.ini"
    sed -Ei "s|width[[:space:]]*\=[[:space:]]*[0-9]+\%|width = 80%|" "$HOME/.config/polybar/config.ini"
    sed -Ei "s|height[[:space:]]*\=[[:space:]]*[0-9]+\%|height = 3%|" "$HOME/.config/polybar/config.ini"
    sed -Ei "s|radius[[:space:]]*\=[[:space:]]*[0-9]+|radius = 15|" "$HOME/.config/polybar/config.ini"
    sed -Ei "s|border-size[[:space:]]*\=[[:space:]]*[0-9]+|border-size = 10|" "$HOME/.config/polybar/config.ini"
    sed -Ei "s|padding[[:space:]]*\=[[:space:]]*[0-9]+|padding = 1|" "$HOME/.config/polybar/config.ini"
    sed -Ei "s|^font-0([^0-9]*)[0-9.]+;[0-9.]+(.*)|font-0\112;3\2|" "$HOME/.config/polybar/config.ini"
    sed -Ei "s|^font-1([^0-9]*)[0-9.]+;[0-9.]+(.*)|font-1\120;4\2|" "$HOME/.config/polybar/config.ini"
    sed -Ei "s|^font-3([^0-9]*)[0-9.]+;[0-9.]+(.*)|font-3\114;3\2|" "$HOME/.config/polybar/config.ini"
    sed -Ei "s|modules-right[[:space:]]*\=[[:space:]]*(.*) pulseaudio bgr .* bgl date br|modules-right = \1 pulseaudio bgr xkeyboard bgl date br|" "$HOME/.config/polybar/config.ini"
    sed -Ei "s|reverse-scroll[[:space:]]*\=[[:space:]]*[a-z]*|reverse-scroll = false|" "$HOME/.config/polybar/modules/i3.ini"
    sed -Ei "s|label-focused[[:space:]]*\=[[:space:]]*.*|label-focused = %index% %icon%|" "$HOME/.config/polybar/modules/i3.ini"
    sed -Ei "s|label-unfocused[[:space:]]*\=[[:space:]]*.*|label-unfocused = %index% %icon%|" "$HOME/.config/polybar/modules/i3.ini"
    sed -Ei "s|reverse-scroll[[:space:]]*\=[[:space:]][a-z]*|reverse-scroll = false|" "$HOME/.config/polybar/modules/pulseaudio.ini"

    # Update Rofi config
    sed -Ei "s|font:[[:space:]]([^0-9]*)[0-9]+(.*)|font: \110\2|g" "$HOME/.config/rofi/config.rasi"

  elif [ "$selected" == "laptop" ]; then
    # Update Alacritty config
    sed -Ei "s|size[[:space:]]*\=[[:space:]]*[0-9]+|size = 10|g" "$HOME/.config/alacritty/alacritty.toml"

    # Update GTK config
    sed -Ei "s|gtk-font-name=[a-zA-Z0-9_[:space:]]*|gtk-font-name=Inter 14|g" "$HOME/.config/gtk-3.0/settings.ini"
    sed -Ei "s|gtk-font-name=[a-zA-Z0-9_[:space:]]*|gtk-font-name=Inter 14|g" "$HOME/.config/gtk-4.0/settings.ini"

    # Update i3 config
    sed -Ei "s|gaps inner [0-9]+|gaps inner 6|g" "$HOME/.config/i3/config"
    sed -Ei "s|gaps outer [0-9]+|gaps outer 2|g" "$HOME/.config/i3/config"
    sed -Ei "s|[#[:space:]]*gaps top [0-9]+|# gaps top 80|g" "$HOME/.config/i3/config"

    # Update picom config
    sed -Ei "s|corner-radius[[:space:]]*\=[[:space:]]*[0-9]+$|corner-radius = 10|" "$HOME/.config/picom/picom.conf"

    # Update polybar config
    sed -Ei "s|override-redirect[[:space:]]*\=[[:space:]]*[a-zA-Z]+$|override-redirect = false|" "$HOME/.config/polybar/config.ini"
    sed -Ei "s|width[[:space:]]*\=[[:space:]]*[0-9]+\%|width = 100%|" "$HOME/.config/polybar/config.ini"
    sed -Ei "s|height[[:space:]]*\=[[:space:]]*[0-9]+\%|height = 4%|" "$HOME/.config/polybar/config.ini"
    sed -Ei "s|radius[[:space:]]*\=[[:space:]]*[0-9]+|radius = 0|" "$HOME/.config/polybar/config.ini"
    sed -Ei "s|border-size[[:space:]]*\=[[:space:]]*[0-9]+|border-size = 15|" "$HOME/.config/polybar/config.ini"
    sed -Ei "s|padding[[:space:]]*\=[[:space:]]*[0-9]+|padding = 0|" "$HOME/.config/polybar/config.ini"
    sed -Ei "s|^font-0([^0-9]*)[0-9.]+;[0-9.]+(.*)|font-0\116;3\2|" "$HOME/.config/polybar/config.ini"
    sed -Ei "s|^font-1([^0-9]*)[0-9.]+;[0-9.]+(.*)|font-1\128.5;6\2|" "$HOME/.config/polybar/config.ini"
    sed -Ei "s|^font-3([^0-9]*)[0-9.]+;[0-9.]+(.*)|font-3\120;4\2|" "$HOME/.config/polybar/config.ini"
    sed -Ei "s|modules-right[[:space:]]*\=[[:space:]]*(.*) pulseaudio bgr .* bgl date br|modules-right = \1 pulseaudio bgr bgl backlight bgr bgl battery bgr bgl date br|" "$HOME/.config/polybar/config.ini"
    sed -Ei "s|reverse-scroll[[:space:]]*\=[[:space:]][a-z]*|reverse-scroll = true|" "$HOME/.config/polybar/modules/i3.ini"
    sed -Ei "s|label-focused[[:space:]]*\=[[:space:]]*.*|label-focused = %index%|" "$HOME/.config/polybar/modules/i3.ini"
    sed -Ei "s|label-unfocused[[:space:]]*\=[[:space:]]*.*|label-unfocused = %index%|" "$HOME/.config/polybar/modules/i3.ini"
    sed -Ei "s|reverse-scroll[[:space:]]*\=[[:space:]][a-z]*|reverse-scroll = true|" "$HOME/.config/polybar/modules/pulseaudio.ini"

    # Update Rofi config
    sed -Ei "s|font:[[:space:]]([^0-9]*)[0-9]+(.*)|font: \113\2|g" "$HOME/.config/rofi/config.rasi"
  fi

  # Restart i3
  i3-msg restart
fi
