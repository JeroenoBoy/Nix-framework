import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts

import "root:/widgets"
import "root:/widgets/system"
import "root:/theme"

Scope {
    id: root
    property string time

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }

    Variants {
        model: Quickshell.screens

        PanelWindow {
            property var modelData
            screen: modelData

            color: "transparent"

            anchors {
                top: true
                left: true
                right: true
            }

            height: Theme.bar.height

            margins {
                left: 4
                right: 4
                top: 4
            }

            BarGroup {
                Battery {}
            }

            BarGroup {
                anchors.right: parent.right

                Tray {}
                Clock {
                    time: clock.date
                }
            }
        }
    }
}
