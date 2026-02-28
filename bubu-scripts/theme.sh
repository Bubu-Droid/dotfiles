#!/usr/bin/env bash

# =============================================================
# Author:  gh0stzk
# Repo:    https://github.com/gh0stzk/dotfiles
# Date:    27.06.2025 11:14:42
#
# RiceSelector - Dynamic theme switcher for gh0stzk bspwm dotfiles
#
# Copyright (C) 2021-2025 gh0stzk <z0mbi3.zk@protonmail.com>
# Licensed under GPL-3.0 license
# =============================================================

# Some vars
read -r current_rice <"$HOME/.rice"

declare -A GTK_DICT
declare -A POLY_DICT

GTK_DICT["tokyonight"]="Tokyonight-Dark"
GTK_DICT["coolnight"]="Tokyonight-Dark"

POLY_DICT["tokyonight"]="F#8db0ff"
POLY_DICT["coolnight"]="F#00BFFF"

# List rices
rices=$(find "$HOME/wallpapers/" -mindepth 1 -maxdepth 1 -type d -exec basename {} \; | sort)

# Find current rice
selected_index=-1
index=0
IFS='
'
for rice in $rices; do
  [ "$rice" = "$current_rice" ] && {
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
  for rice in $rices; do
    printf "%s\000icon\037%s/wallpapers/%s/preview.png\n" "$rice" "$HOME" "$rice"
  done | rofi -dmenu -p "Theme Selector" \
    -theme "$HOME/.config/rofi/selector.rasi" \
    -selected-row "$selected_index"
)

# If a valid option was selected, write the value to the configuration file and change theme.
if [ -n "$selected" ] && [ "$selected" != "$current_rice" ]; then
  echo "$selected" >"$HOME"/.rice

  # Update Polybar theme
  sed -Ei "s|polybar/colors/[^/]+\.ini|polybar/colors/$selected.ini|g" "$HOME/.config/polybar/config.ini"
  sed -Ei "s|%\{F#[0-9a-fA-F]{6}\}|%{${POLY_DICT[$selected]}}|g" "$HOME/.config/polybar/modules/xkeyboard.ini"

  # Update Alacritty theme
  sed -Ei "s|themes/[^/]+\.toml|themes/$selected.toml|g" "$HOME/.config/alacritty/alacritty.toml"

  # Update Rofi theme
  sed -Ei "s|themes/[^/]+\.rasi|themes/$selected.rasi|g" "$HOME/.config/rofi/config.rasi"
  sed -Ei "s|themes/[^/]+\.rasi|themes/$selected.rasi|g" "$HOME/.config/rofi/powermenu.rasi"
  sed -Ei "s|themes/[^/]+\.rasi|themes/$selected.rasi|g" "$HOME/.config/rofi/selector.rasi"
  sed -Ei "s|images/[^/]+\.webp|images/$selected-bg.webp|g" "$HOME/.config/rofi/config.rasi"
  sed -Ei "s|images/[^/]+\.webp|images/$selected-bg.webp|g" "$HOME/.config/rofi/powermenu.rasi"

  # Update wallpaper in i3 config
  sed -Ei "s|wallpapers/[^/]+/([^/]+)\.png|wallpapers/$selected/\1.png|g" "$HOME/.config/i3/config"

  # Update GTK theme
  sed -Ei "s|gtk-theme-name=.*|gtk-theme-name=${GTK_DICT[$selected]}|g" "$HOME/.config/gtk-3.0/settings.ini"
  sed -Ei "s|gtk-theme-name=.*|gtk-theme-name=${GTK_DICT[$selected]}|g" "$HOME/.config/gtk-4.0/settings.ini"
  sudo sed -Ei "s|GTK_THEME=.*|GTK_THEME=${GTK_DICT[$selected]}|g" "/etc/environment"

  # Restart i3
  i3-msg restart
fi
