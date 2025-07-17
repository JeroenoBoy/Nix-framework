import Quickshell
import QtQuick
import QtQuick.Layouts
import "root:/theme"

RowLayout {
    id: root
    height: parent.height

    property real paddingX: Theme.bar.paddingX
    property real paddingY: Theme.bar.paddingY
    default property alias items: rowLayout.children

    Rectangle {
        anchors.fill: parent

        color: Theme.bg.color
        radius: 16

        border {
            color: Theme.bg.borderColor
            width: Theme.bg.borderWidth
        }
    }

    Item {
        id: rowParent
        height: parent.height
        implicitWidth: rowLayout.implicitWidth + root.paddingX * 2 + 2
        implicitHeight: rowLayout.implicitHeight + root.paddingY * 2

        RowLayout {
            id: rowLayout
            height: parent.height
            anchors.centerIn: parent
            x: root.paddingX
            y: root.paddingY
            spacing: Theme.bar.spacing
        }
    }
}
