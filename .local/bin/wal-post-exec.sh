#!/bin/bash

# move wallpaper to login/lock screen also
BGPATH=$(cat "$HOME"/.cache/wal/wal)
cp "$BGPATH" /usr/share/wallpapers/wal

# telegram-desktop palette
tg-pallete-gen

# restart dependent services
systemctl --user restart dunst

