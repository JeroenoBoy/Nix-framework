#!/usr/bin/sh

pkill swaync
pkill hypridle
pkill eww

hyprctl reload
sh ~/.sh/wallpaper-init.sh
swaync & hypridle & eww open topbar
