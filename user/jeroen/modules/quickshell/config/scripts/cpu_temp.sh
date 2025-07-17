#!/bin/sh

base="/sys/class/thermal"
values=()

for f in $(ls $base | grep thermal_zone); do
    values+=(`cat "$base/$f/temp"`)
done

join_arr() {
    local IFS="+"
    echo "$*"
}

printf -v joined '%s+' "${values[@]}"
echo `wcalc -q "(${joined%+})/(1000*${#values[@]})"`
