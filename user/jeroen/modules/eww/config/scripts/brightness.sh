
getBrightness() {
    local b=`brightnessctl i | grep -oEi "([0-9]+%)"`
    echo ${b::-1}
}

echo `getBrightness`

if [[ $1 == "--listen" ]]; then
    udevadm monitor | while read -r line; do
        if [[ $line =~ ^KERNEL.*\(backlight\)$ ]]; then
            echo `getBrightness`
        fi
    done
fi
