#!/usr/bin/env sh
pkill mpvpaper
mpvpaper -fp -o "no-audio --loop-file=inf --panscan=1.0" '*' ~/.assets/wallpaper.mp4
