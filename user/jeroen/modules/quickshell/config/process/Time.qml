import Quickshell
import Quickshell.Io
import QtQuick

Scope {
    id: root
    property string time

    Process {
        id: dataProc
        command: ["date", "\"+%a %d %b %H:%M\""]
        running: true
        stdout: StdioCollector {
            onStreamFinished: root.time = this.text
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: dataProc.running = true
    }
}


