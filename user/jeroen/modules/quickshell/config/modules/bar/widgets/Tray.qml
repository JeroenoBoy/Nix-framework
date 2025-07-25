import QtQuick
import QtQuick.Layouts
import Quickshell.Services.SystemTray

BarItem {
    id: root
    required property var panel

    spacing: 8
    Repeater {
        model: SystemTray.items

        TrayItem {
            required property SystemTrayItem modelData
            panel: root.panel
            item: modelData
            implicitWidth: 16
            implicitHeight: 16
        }
    }
}
