import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts

import "root:/modules/bar/widgets"
import "root:/modules/bar/widgets/system"
import "root:/theme"

Scope {
    id: root
    property ShellScreen screen
    property string time

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }

    PanelWindow {
        screen: screen

        color: "transparent"

        anchors {
            top: true
            left: true
            right: true
        }

        implicitHeight: Theme.bar.height

        margins {
            left: 4
            right: 4
            top: 4
        }

        BarGroup {
            Battery {}
            Ram {}
            Cpu {}
            Storage {}
            Temp {}
        }

        BarGroup {
            anchors.centerIn: parent
            Workspaces {
                bar: root
            }
        }

        MouseArea {
            anchors.right: parent.right
            BarGroup {

                Tray {}
                Clock {
                    time: clock.date
                }
            }
        }
    }
}
