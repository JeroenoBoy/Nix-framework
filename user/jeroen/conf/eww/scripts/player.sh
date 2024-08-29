
getPlayers() {
    local players=`playerctl -sl`
    echo ${players[@]}
}

formatPlayers() {
    local players=`getPlayers | tr "\\n" ","`
    echo "${players::-1}"
}

getActivePlayer() {
    local players=`getPlayers`
    local activePlayer=${players[0]}
    
    for player in $players; do
        local status=`playerctl status -p "$player"`
        if [[ $status == "Playing"  ]]; then
            activePlayer=$player
            break
        fi
    done

    echo $activePlayer
}

getPlayerData() {
    local player=$1
    if [[ $player == "" ]]; then
        echo "{\"found\":false}"
        return 1
    fi

    local data=`playerctl metadata -p "$player"`
    if [[ $player == "No players found" ]]; then
        echo "{\"found\":false}"
        return 1
    fi

    local artUrl=`echo "${data}" | grep "mpris:artUrl" | sed "s/^\\w* mpris:\\w* *//"`
    local title=`echo "${data}" | grep "xesam:title" | sed "s/^\\w* xesam:\\w* *//"`
    local artist=`echo "${data}" | grep "xesam:artist" | sed "s/^\\w* xesam:\\w* *//"`
    local status=`playerctl status -p "$player"`
    
    echo "{\"found\":true,\"player\":\"$player\",\"status\":\"$status\",\"artist\":\"$artist\",\"title\":\"$title\",\"art_url\":\"$artUrl\"}"
}

handleNewMessage() {
    if [[ $1 =~ mpris:length\  ]]; then
        activePlayer=`getActivePlayer`
        echo `getPlayerData $activePlayer`
    fi
}

if [[ $1 == "players" ]]; then
    echo `formatPlayers`
elif [[ $1 == "data" ]]; then
    echo "todo"
elif [[ $1 == "activePlayer" ]]; then
    if [[ $2 == "--listen" ]]; then
        playerctl metadata -F | while read -r line;
            do handleNewMessage "$line"
        done
    else
        activePlayer=`getActivePlayer`
        echo `getPlayerData $activePlayer`
    fi
fi
