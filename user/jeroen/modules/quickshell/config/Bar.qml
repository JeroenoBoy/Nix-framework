import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts

import "root:/widgets"

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

            implicitHeight: 30

            margins {
                left: 4
                right: 4
                top: 4
            }

            BarGroup {
                anchors.right: parent.right
                height: parent.height

                Tray {}
                Clock {
                    time: clock.date
                }
            }
        }
    }
}
