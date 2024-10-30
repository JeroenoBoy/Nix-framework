
wallpaperCacheDir="$HOME/.cache/activeWallpaper.txt"

pkill rofi

menus() {
    printf "Random\x00icon\x1f$HOME/.assets/random.jpg\n"
    sh $HOME/.sh/ls_wallpapers.sh | while read w
    do
        local name="${w::-1}"
        local itemName="${name##*/}"
        printf "$itemName\x00icon\x1f$name/wallpaper.png\n"
    done
}

selected=`menus | rofi -show -i -dmenu -config "$HOME/.config/rofi/themes/wallpapers.rasi"`
if [[ $selected == "" ]]; then
    exit 0
fi

if [[ $selected == "Random" ]]; then
    selected=`sh "$HOME/.sh/ls_wallpapers.sh" | sort -R | tail -1`
else
    selected=`sh $HOME/.sh/ls_wallpapers.sh | grep "$selected/"`
    echo "$selected"
fi

echo "$selected" > "$wallpaperCacheDir"

processes=`ps -x`
wallpaperPID=`echo "$processes" | grep ".sh/wallpaper.sh" | awk "{print $1}"`
if [[ ! $wallpaperPID == "" ]]; then
    kill $wallpaperPID
fi

setsid sh "$HOME/.sh/wallpaper.sh" --listen &> /dev/null
