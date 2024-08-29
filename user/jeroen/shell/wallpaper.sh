
current=""
regexp="^KERNEL\s*\[\d*\.\d*\]\s*(add|remove) *[\w/]* *\(usb_power_delivery\)$"

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
    if [[ $current == "mpv" ]]; then
        return 1
    fi
    current="mpv"
    pkill hyprpaper
    pkill mpvpaper
    mpvpaper -fp -o "no-audio --loop-file=inf --panscan=1.0" '*' ~/.assets/wallpaper.mp4
    echo "starting mpvpaper"
}

use_hyprpaper() {
    if [[ $current == "hypr" ]]; then
        return 1
    fi
    current="hypr"
    pkill hyprpaper
    pkill mpvpaper
    hyprpaper &> /dev/null & disown
    echo "started hyprpaper"
}

switch_wallpaper

if [[ $1 == "--listen" ]]; then
    echo "Started listening!"
    listen
fi
