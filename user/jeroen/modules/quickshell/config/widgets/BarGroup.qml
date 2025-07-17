import Quickshell
import QtQuick
import QtQuick.Layouts
import "root:/theme"

Item {
    id: root

    width: rowParent.implicitWidth
    height: parent.height

    property real paddingX: Theme.bar.paddingX
    property real paddingY: Theme.bar.paddingY
    default property alias items: rowLayout.children

    Rectangle {
        anchors.fill: parent
        color: Theme.bg.color
        radius: Theme.bar.rounding

        border {
            color: Theme.bg.borderColor
            width: Theme.bg.borderWidth
        }
    }

    Item {
        id: rowParent
        implicitWidth: rowLayout.implicitWidth + root.paddingX * 2
        implicitHeight: rowLayout.implicitHeight + root.paddingY * 2

        RowLayout {
            id: rowLayout
            height: parent.height
            anchors.centerIn: parent
            spacing: Theme.bar.spacing
        }
    }
}
