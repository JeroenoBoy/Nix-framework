import QtQuick
import QtQuick.Layouts
import Quickshell.Services.SystemTray

RowLayout {
    Repeater {
        model: SystemTray.items

        TrayItem {
            required property SystemTrayItem modelData
            item: modelData
            implicitWidth: 16
            implicitHeight: 16
        }
    }
}
