pragma Singleton
pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root
    property string user: ""
    property string userIcon: "/var/lib/AccountsService/icons/" + user
    property string uptime: ""

    Timer {
        running: true
        repeat: true
        interval: 1
        onTriggered: {
            uptime.running = true;
            this.interval = 10000;
        }
    }

    Process {
        running: true
        command: ["whoami"]
        stdout: StdioCollector {
            onStreamFinished: user = this.text.trim()
        }
    }

    Process {
        id: uptime
        command: ["uptime"]
        stdout: StdioCollector {
            onStreamFinished: {
                let txt = this.text.match(/up\s([\w\d\s:]+)/)[1].trim();

                if (/\d+:\d+$/.test(txt)) {
                    let d = txt.match(/(\d)+:(\d)+$/);
                    let h = d[1];
                    let m = d[2];
                    root.uptime = txt.replace(d[0], "") + `${h} hours ${m} minutes`;
                }
            }
        }
    }
}
