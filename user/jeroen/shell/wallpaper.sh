
hyprpaperPath="$HOME/.config/hypr/hyprpaper.conf"
wallpaperCacheDir="$HOME/.cache/activeWallpaper.txt"
regexp="^KERNEL\s*\[\d*\.\d*\]\s*(add|remove) *[\w/]* *\(usb_power_delivery\)$"

hyprpaperConfig="
preload = @WALLPAPER@/wallpaper.png
wallpaper = , @WALLPAPER@/wallpaper.png
"

currentType=""
currentPaper="LaiOS/Cat Waterfall"

listen() {
    udevadm monitor | while read -r line; do
        if [[ $line =~ ^KERNEL.*\(usb_power_delivery\)$ ]]; then
            switch_wallpaper
        fi
    done
}

switch_wallpaper() {
    isPluggedIn=`cat /sys/class/power_supply/ACAD/online`
    if [[ $isPluggedIn == 1 ]]; then
        use_mpv
    else
        use_hyprpaper
    fi
}

use_mpv() {
    if [[ $currentType == "mpv" ]]; then
        return 1
    fi
    currentType="mpv"
    pkill hyprpaper
    pkill mpvpaper
    mpvpaper -fp -o "no-audio --loop-file=inf --panscan=1.0" '*' "${currentPaper}/wallpaper.mp4"
    echo "starting mpvpaper"
}

use_hyprpaper() {
    if [[ $currentType == "hypr" ]]; then
        return 1
    fi
    currentType="hypr"
    pkill hyprpaper
    pkill mpvpaper
    echo "$hyprpaperConfig" | sed -e "s/@WALLPAPER@/$currentPaper/g" > ${hyprpaperPath}

    hyprpaper &> /dev/null & disown
    echo "started hyprpaper"
}

if [ ! -f "$wallpaperCacheDir" ]; then
    echo "$currentPaper" > "$wallpaperCacheDir"
fi

currentPaper=`cat "${wallpaperCacheDir}"`

if [[ $1 == "-h" ]]; then
    use_hyprpaper
    exit 0
fi

if [[ $1 == "-m" ]]; then
    use_mpv
    exit 0
fi

switch_wallpaper

if [[ $1 == "--listen" ]]; then
    echo "Started listening!"
    listen
fi
