icons_charging="󰢟󰢜󰂆󰂇󰂈󰢝󰂉󰢞󰂊󰂋󰂅"
icons_discharging="󰂎󱊡󰁻󰁼󰁽󰁾󰁿󰂀󰂁󰂂󰁹"

path="/sys/class/power_supply"
bat=`ls ${path} | grep BAT | head -n 1`

percentage=`cat ${path}/${bat}/capacity`
status=`cat ${path}/${bat}/status`

if [[ ${status} == "Charging" ]]; then
    spacing=" "
    icons_list=${icons_charging}
else
    spacing=" "
    icons_list=${icons_discharging}
fi

iconToPick=`wcalc -q "ceil(${percentage}/100*(${#icons_list}-1))"`
echo "${icons_list:${iconToPick}}${spacing}${percentage}%"
