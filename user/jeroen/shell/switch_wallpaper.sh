
wallpaperDirectory="$HOME/.assets/wallpapers"
wallpaperCacheDir="$HOME/.cache/activeWallpaper.txt"

pkill rofi
wallpapers=`ls --literal "$wallpaperDirectory"`

menus() {
    local papers=()
    for w in $HOME/.assets/wallpapers/*/; do
        local name="${w#"${wallpaperDirectory}/"}"
        name=${name::-1}
        printf "$name\x00icon\x1f$wallpaperDirectory/$name/wallpaper.png\n"
    done
}

selected=`menus | rofi -show -dmenu -config "$HOME/.config/rofi/themes/wallpapers.rasi"`
if [[ $selected == "" ]]; then
    exit 0
fi

echo $selected > "$wallpaperCacheDir"

kill `ps -x | grep ".sh/wallpaper.sh" | awk '{print $1}'`
sh "$HOME/.sh/wallpaper.sh"
