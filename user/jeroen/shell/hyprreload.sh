#!/usr/bin/sh

pkill waybar
pkill swaync
pkill hypridle

hyprctl reload
sh ~/.sh/wallpaper-init.sh
waybar & swaync & hypridle
