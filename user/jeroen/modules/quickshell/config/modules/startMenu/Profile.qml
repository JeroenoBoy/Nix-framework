import Quickshell
import QtQuick
import QtQuick.Layouts
import "root:/theme"
import "root:/services"

Item {
    implicitWidth: parent.implicitWidth
    implicitHeight: column.implicitHeight + 32

    Rectangle {
        anchors.fill: parent
        color: Theme.startMenu.profile.bg
        radius: 8
    }

    RowLayout {
        id: column
        x: 16
        y: 16
        implicitWidth: parent.implicitWidth - 32

        spacing: 10

        Rectangle {
            width: 64
            height: 64
            radius: 64
            color: Theme.gray8
            Layout.maximumWidth: this.width
            Rectangle {
                width: 76
                height: 76
                radius: 76
                x: -6
                y: -6
                color: "transparent"
                border.width: 1
                border.color: Theme.green2
            }
            Image {
                width: 64
                height: 64
                fillMode: Image.Stretch
                source: UserService.userIcon
            }
        }

        Item {} // For spacing

        ColumnLayout {
            Txt {
                font: Theme.txt.lg
                text: UserService.user
            }

            Txt {
                font: Theme.txt.sm
                color: Theme.txt.muted
                text: "Uptime: " + UserService.uptime
            }
        }

        Item {
            Layout.fillWidth: true
        }

        IconBtn {
            style: Theme.button.blue
            text: ""
        }

        IconBtn {
            style: Theme.button.danger
            text: ""
        }
    }
}
