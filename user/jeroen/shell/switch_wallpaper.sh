
wallpaperDirectory="$HOME/.assets/wallpapers"
wallpaperCacheDir="$HOME/.cache/activeWallpaper.txt"

pkill rofi

menus() {
    printf "Random\x00icon\x1f$HOME/.assets/random.jpg\n"
    for w in $HOME/.assets/wallpapers/*/; do
        local name="${w#"${wallpaperDirectory}/"}"
        name=${name::-1}
        printf "$name\x00icon\x1f$wallpaperDirectory/$name/wallpaper.png\n"
    done
}

selected=`menus | rofi -show -i -dmenu -config "$HOME/.config/rofi/themes/wallpapers.rasi"`
if [[ $selected == "" ]]; then
    exit 0
fi

if [[ $selected == "Random" ]]; then
    selected=`ls "$wallpaperDirectory" | sort -R | tail -1`
fi

echo $selected > "$wallpaperCacheDir"

processes=`ps -x`
wallpaperPID=`echo "$processes" | grep ".sh/wallpaper.sh" | awk "{print $1}"`
if [[ ! $wallpaperPID == "" ]]; then
    kill $wallpaperPID
fi

setsid sh "$HOME/.sh/wallpaper.sh" --listen &> /dev/null
