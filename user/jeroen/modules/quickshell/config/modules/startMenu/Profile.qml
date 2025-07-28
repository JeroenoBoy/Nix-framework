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

        spacing: 8

        Item {
            width: 64
            height: 64
            Layout.maximumWidth: this.width
            Image {
                width: 64
                height: 64
                fillMode: Image.Stretch
                source: UserService.userIcon
            }
        }

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
