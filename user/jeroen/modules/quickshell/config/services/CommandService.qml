pragma Singleton
pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    property bool isIdlerRunning: true
    property bool isWallpaperAnimated: true

    function toggleIdler() {
        idlerToggle.running = true;
    }

    function toggleAnimatedWallpaper() {
        wallpaperToggle.running = true;
    }

    Timer {
        interval: 1
        running: true
        repeat: true

        onTriggered: {
            this.interval = 10000;
            idlerStatus.running = true;
            wallpaperStatus.running = true;
        }
    }

    Process {
        id: idlerStatus
        command: ["sh", Quickshell.shellPath("scripts/idler.sh"), "status"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: {
                isIdlerRunning = this.text.startsWith("t");
            }
        }
    }

    Process {
        id: idlerToggle
        command: ["sh", Quickshell.shellPath("scripts/idler.sh"), "toggle"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: {
                idlerStatus.running = true;
            }
        }
    }

    Process {
        id: wallpaperStatus
        command: ["sh", Quickshell.shellPath("scripts/wallpaper.sh"), "status"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: {
                isWallpaperAnimated = this.text.startsWith("t");
            }
        }
    }

    Process {
        id: wallpaperToggle
        command: ["sh", Quickshell.shellPath("scripts/wallpaper.sh"), "toggle"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: {
                wallpaperStatus.running = true;
            }
        }
    }
}
