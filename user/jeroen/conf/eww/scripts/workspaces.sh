
basetemplate="(box :class 'workspaces' :orientation 'horizontal' :space-evenly false :vexpand true :hexpand true %s)"
itemtemplate="(box :class '%s' '')"

echoworkspaces() {
    local workspaces=`hyprctl -j workspaces | jq ".[].id" | grep -v "-" | sort`
    local activeworkspace=`hyprctl -j activeworkspace | jq ".id"`

    local items=()

    for id in ${workspaces[@]}; do
        local class="workspace"
        if [[ $id == $activeworkspace ]]; then
            class+=" active"
        fi

        printf -v inserted "$itemtemplate" "$class"
        items+=$inserted
    done

    printf -v result "$basetemplate" "$items"
    final=`echo "${result}" | tr "'" "\""`
    echo "${final}"
}

handle() {
    case $1 in
        workspacev2*) echoworkspaces;;
        destroyworkspacev2*) echoworkspaces;;
        createworkspacev2*) echoworkspaces;;
    esac
}

echoworkspaces
nc -U "$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" | while read -r line; do handle "$line"; done
