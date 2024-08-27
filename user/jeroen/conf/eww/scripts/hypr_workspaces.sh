
getWorkspaces() {
    local values=`hyprctl -j workspaces | jq ".[].id" | grep -v "-" | sort | tr "\\n" ","`
    echo "[${values::-1}]"
}

getActiveWorkspace() {
    echo `hyprctl -j activeworkspace | jq ".id"`
}

listen_WorkspacesUpdate() {
    case $1 in
        destroyworkspacev2*) getWorkspaces;;
        createworkspacev2*) getWorkspaces;;
    esac
}

listen_ActiveWorkspaceChange() {
    case $1 in
        workspacev2*) getActiveWorkspace;;
    esac
}

if [[ $1 == "active" ]]; then
    getActiveWorkspace
    nc -U "$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" | while read -r line; do listen_ActiveWorkspaceChange "$line"; done
elif [[ $1 == "all" ]]; then
    getWorkspaces
    nc -U "$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" | while read -r line; do listen_WorkspacesUpdate "$line"; done
fi
