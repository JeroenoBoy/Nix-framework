import Quickshell
import Quickshell.Io
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts

import "root:/modules/bar/widgets"
import "root:/modules/bar/widgets/system"
import "root:/modules/startMenu"
import "root:/theme"

Scope {
    id: root
    property ShellScreen screen
    property string time

    property bool startMenuOpen: true
    property bool mouseOverRight: false

    SystemClock {
        id: clock
        precision: startMenuOpen ? SystemClock.Seconds : SystemClock.Minutes
    }

    PanelWindow {
        id: panelRoot
        screen: screen

        color: "transparent"

        anchors {
            top: true
            left: true
            right: true
        }

        implicitHeight: Theme.bar.height

        margins {
            top: 4
            left: 4
            right: 4
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
            id: rightGroupMouseArea
            anchors.right: parent.right
            implicitWidth: rightGroup.implicitWidth
            height: parent.height
            hoverEnabled: true

            onPressed: startMenuOpen = !startMenuOpen
            onEntered: mouseOverRight = true
            onExited: mouseOverRight = false

            BarGroup {
                id: rightGroup

                Tray {
                    panel: panelRoot
                }

                Clock {
                    showSeconds: startMenuOpen
                    time: clock.date
                }
            }

            Behavior on implicitWidth {
                animation: NumberAnimation {
                    target: rightGroupMouseArea
                    property: "implicitWidth"
                    duration: 200
                    easing.type: Easing.OutSine
                }
            }
        }
    }

    LazyLoader {
        active: startMenuOpen
        component: StartMenu {
            screen: root.screen
        }
    }
}
