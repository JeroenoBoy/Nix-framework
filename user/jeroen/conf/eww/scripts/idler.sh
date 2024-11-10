
set -e

isRunning() {
    local isRunning=`systemctl --user status hypridle | grep "active (running)"`
    if [[ $isRunning = "" ]]; then
        echo "false"
    else 
        echo "true"
    fi
}

start() {
    systemctl --user start hypridle
}

stop() {
    systemctl --user stop hypridle
}

if [[ $1 = "status" ]]; then
    isRunning
elif [[ $1 = "toggle" ]]; then
    if [[ `isRunning` = "false" ]]; then
        start
        echo "Started hypridle"
    else 
        stop
        echo "Stopped hypridle"
    fi
fi
