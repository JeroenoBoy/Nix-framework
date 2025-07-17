import Quickshell
import QtQuick
import QtQuick.Layouts

RowLayout {
    id: root

    property real margin: 6
    default property alias items: rowLayout.children

    Rectangle {
        anchors {
            fill: parent
        }
        color: "red"
        radius: 16
        border {
            color: "blue"
            width: 2
        }
    }

    Item {
        id: rowParent
        height: parent.height
        implicitWidth: rowLayout.implicitWidth + root.margin * 2 + 2

        RowLayout {
            id: rowLayout
            height: parent.height
            x: root.margin
        }
    }
}
