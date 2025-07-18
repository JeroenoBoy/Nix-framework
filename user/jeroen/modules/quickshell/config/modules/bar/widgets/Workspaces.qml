import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import "root:/theme"

BarItem {
    id: root

    required property var bar
    readonly property HyprlandMonitor monitor: Hyprland.monitorFor(bar.screen)

    readonly property list<HyprlandWorkspace> workspaces: Hyprland.workspaces.values.filter(it => it.monitor == monitor && it.id >= 0)
    readonly property HyprlandWorkspace activeWorkspace: monitor.activeWorkspace

    spacing: Theme.workspaces.spacing

    Repeater {
        model: workspaces

        WorkspaceItem {
            required property HyprlandWorkspace modelData
            Layout.alignment: Qt.AlignVCenter
            active: activeWorkspace == modelData
            workspace: modelData
        }
    }
}
