
WALLPAPER_DIR="$HOME/Documents/Wallpapers"

cd $WALLPAPER_DIR

list_wallpapers() {
    for w in $WALLPAPER_DIR/*/*/; do
        printf "${w[$i]}\n"
    done

}

list_wallpapers
