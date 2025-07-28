import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import "root:/theme"
import "root:/services"

Scope {
    id: root

    required property ShellScreen screen

    PanelWindow {
        id: panel
        screen: screen
        color: "transparent"

        anchors {
            top: true
            right: true
            bottom: true
        }

        margins {
            top: 2
            right: -1
            bottom: 2
        }

        exclusiveZone: 0
        implicitWidth: Theme.startMenu.width
        WlrLayershell.namespace: "quickshell:sidebarRight"
        WlrLayershell.layer: WlrLayer.Top

        Item {
            id: layout
            anchors.right: parent.right
            implicitWidth: Theme.startMenu.width
            height: parent.height

            Rectangle {
                anchors.fill: parent
                color: Theme.bg.color
                topLeftRadius: Theme.bar.rounding
                bottomLeftRadius: Theme.bar.rounding

                border {
                    color: Theme.bg.borderColor
                    width: Theme.bg.borderWidth
                }
            }

            ColumnLayout {
                x: Theme.startMenu.padding
                y: Theme.startMenu.padding
                implicitWidth: parent.implicitWidth - Theme.startMenu.padding * 2

                spacing: Theme.startMenu.spacing

                Profile {}

                RowLayout {
                    Btn {
                        Layout.fillWidth: true
                        Layout.horizontalStretchFactor: 1
                        size: Theme.button.lg
                        style: Theme.button.green
                        cBackground: Theme.green2

                        Txt {
                            font: Theme.txt.lg
                            text: "  Wifi"
                        }
                    }
                    Btn {

                        Layout.fillWidth: true
                        Layout.horizontalStretchFactor: 1

                        size: Theme.button.lg
                        style: Theme.button.blue
                        cBackground: Theme.blue2

                        Txt {
                            font: Theme.txt.lg
                            text: " Bluetooth"
                        }
                    }
                }
                RowLayout {
                    Slider {
                        value: 0.5
                        contentItem: Label {
                            verticalAlignment: Text.AlignVCenter
                            text: "123"
                        }
                    }
                }
            }
        }

        NumberAnimation {
            running: true
            target: layout
            property: "implicitWidth"
            from: 0
            to: Theme.startMenu.width
            duration: 1000
            easing.type: Easing.OutExpo
        }

        NumberAnimation {
            running: true
            target: layout
            property: "opacity"
            from: 0
            to: Theme.startMenu.opacity
            duration: 1000
            easing.type: Easing.OutExpo
        }
    }
}
