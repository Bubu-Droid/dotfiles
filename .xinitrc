#!/usr/bin/env bash

xinitdir="/etc/X11/xinit"

if [ -d "$xinitdir"/xinitrc.d ]; then
  for f in "$xinitdir/xinitrc.d"/?*.sh; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

numlockx &
clipcatd &
flameshot &
exec i3
