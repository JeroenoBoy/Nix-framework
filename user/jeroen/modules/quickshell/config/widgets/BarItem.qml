import Quickshell
import QtQuick
import QtQuick.Layouts

Item {
    id: root

    implicitWidth: row.implicitWidth
    height: parent.height

    property real spacing: 0
    default property alias items: row.children

    RowLayout {
        id: row
        spacing: root.spacing
    }
}
