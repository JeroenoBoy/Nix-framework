import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets
import Quickshell.Services.SystemTray

MouseArea {
    id: root
    required property SystemTrayItem item
    property double trayItemWidth

    acceptedButtons: Qt.LeftButton | Qt.RightButton

    Layout.fillHeight: true
    implicitWidth: trayItemWidth

    IconImage {
        id: icon
        source: root.item.icon
        anchors.centerIn: parent
        width: parent.width
        height: parent.height
    }
}
