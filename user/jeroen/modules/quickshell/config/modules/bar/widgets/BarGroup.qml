import Quickshell
import QtQuick
import QtQuick.Layouts
import "root:/theme"

Item {
    id: root

    implicitWidth: rowParent.implicitWidth
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
        height: parent.height - root.paddingY * 2

        RowLayout {
            id: rowLayout
            height: parent.height
            x: root.paddingX
            y: root.paddingY
            spacing: Theme.bar.spacing
        }
    }
}
