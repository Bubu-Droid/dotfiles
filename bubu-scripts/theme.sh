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
  sed -i "$HOME/.config/polybar/config.ini" \
    -e "s|\$HOME/.config/polybar/colors/.*\.ini|\$HOME/.config/polybar/colors/$selected.ini|"
  if [ "$selected" = "tokyonight" ]; then
    sed -i "$HOME/.config/polybar/modules/xkeyboard.ini" \
      -e "s|%{F#[0-9a-fA-F]\{6\}}|%{F#8db0ff}|"
  elif [ "$selected" = "coolnight" ]; then
    sed -i "$HOME/.config/polybar/modules/xkeyboard.ini" \
      -e "s|%{F#[0-9a-fA-F]\{6\}}|%{F#00BFFF}|"
  else
    sed -i "$HOME/.config/polybar/modules/xkeyboard.ini" \
      -e "s|%{F#[0-9a-fA-F]\{6\}}|%{F#8db0ff}|"
  fi

  # Update Alacritty theme
  sed -i "$HOME/.config/alacritty/alacritty.toml" \
    -e "s|/home/bubu/.config/alacritty/themes/.*\.toml|/home/bubu/.config/alacritty/themes/$selected.toml|"

  # Update Rofi theme
  if [ "$selected" = "tokyonight" ]; then
    sed -i "$HOME/.config/rofi/config.rasi" \
      -e 's|background:[[:space:]]*#[0-9a-fA-F]\+;|background: #15161E;|'
    sed -i "$HOME/.config/rofi/config.rasi" \
      -e 's|background-alt:[[:space:]]*#[0-9a-fA-F]\+;|background-alt: #1A1B26;|'
    sed -i "$HOME/.config/rofi/config.rasi" \
      -e 's|bg/[a-zA-Z0-9_.-]\+|bg/tokyonight-bg.webp|'
  elif [ "$selected" = "coolnight" ]; then
    sed -i "$HOME/.config/rofi/config.rasi" \
      -e 's|background:[[:space:]]*#[0-9a-fA-F]\+;|background: #11092D;|'
    sed -i "$HOME/.config/rofi/config.rasi" \
      -e 's|background-alt:[[:space:]]*#[0-9a-fA-F]\+;|background-alt: #281657;|'
    sed -i "$HOME/.config/rofi/config.rasi" \
      -e 's|bg/[a-zA-Z0-9_.-]\+|bg/coolnight-bg.png|'
  else
    sed -i "$HOME/.config/rofi/config.rasi" \
      -e 's|background:[[:space:]]*#[0-9a-fA-F]\+;|background: #15161E;|'
    sed -i "$HOME/.config/rofi/config.rasi" \
      -e 's|background-alt:[[:space:]]*#[0-9a-fA-F]\+;|background-alt: #1A1B26;|'
    sed -i "$HOME/.config/rofi/config.rasi" \
      -e 's|bg/[a-zA-Z0-9_.-]\+|bg/tokyonight-bg.webp|'
  fi

  # Update wallpaper in i3 config
  sed -i "$HOME/.config/i3/config" \
    -e "s|\$HOME/wallpapers/$current_rice/.*\.png|\$HOME/wallpapers/$selected/01.png|"

  # Update GTK theme
  if [ "$selected" = "tokyonight" ] || [ "$selected" = "coolnight" ]; then
    sed -i "$HOME/.config/gtk-3.0/settings.ini" \
      -e "s|^gtk-theme-name=.*|gtk-theme-name=Tokyonight-Dark|"
    sed -i "$HOME/.config/gtk-4.0/settings.ini" \
      -e "s|^gtk-theme-name=.*|gtk-theme-name=Tokyonight-Dark|"
    sudo sed -i "/etc/environment" \
      -e "s|^GTK_THEME=.*|GTK_THEME=Tokyonight-Dark|"
  else
    sed -i "$HOME/.config/gtk-3.0/settings.ini" \
      -e "s|^gtk-theme-name=.*|gtk-theme-name=Tokyonight-Dark|"
    sed -i "$HOME/.config/gtk-4.0/settings.ini" \
      -e "s|^gtk-theme-name=.*|gtk-theme-name=Tokyonight-Dark|"
    sudo sed -i "/etc/environment" \
      -e "s|^GTK_THEME=.*|GTK_THEME=Tokyonight-Dark|"
  fi

  # Restart i3
  i3-msg restart
fi
