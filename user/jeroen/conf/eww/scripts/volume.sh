
getVolume() {
    local vol=`amixer sget Master | grep -oEi "[0-9]+%" | head -1`
    echo ${vol::-1}
}


getVolume
