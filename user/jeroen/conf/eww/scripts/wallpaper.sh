animateWallpaperDir="$HOME/.cache/animateWallpaper.txt"
wallpaperScript="$HOME/.sh/wallpaper.sh"

isRunning=`cat "$animateWallpaperDir"`
if [[ $1 == "status" ]]; then
    if [[ $isRunning == "y" ]]; then
        echo "true"
    else
        echo "false"
    fi
elif [[ $1 == "toggle" ]]; then
    if [[ $isRunning == "y" ]]; then
        echo "n" > "$animateWallpaperDir"
    else
        echo "y" > "$animateWallpaperDir"
    fi
    sh "$wallpaperScript"
fi
