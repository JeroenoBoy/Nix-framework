wallpapersDirectory="/etc/nixos/user/$USER/assets/wallpapers"

name="$1"
path="$2"

if [[ ! $path =~ mp4$ ]]; then
    echo "File path must end with .mp4"
    exit 0
fi

dirPath="$wallpapersDirectory/$name"
videoPath="$wallpapersDirectory/$name/wallpaper.mp4"
imgPath="$wallpapersDirectory/$name/wallpaper.png"

mkdir "$dirPath"
mv "$path" "$videoPath"

ffmpeg -i "$videoPath" -vf "select=eq(n\,34)" -vframes 1 "$imgPath"

cd /etc/nixos
git add $videoPath
git add $dirPath

echo "
Run 'sudo nixos-rebuild switch' to apply the new wallpaper
"
