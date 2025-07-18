import QtQuick
import Quickshell.Hyprland
import "root:/theme"
import Qt5Compat.GraphicalEffects

Rectangle {
    id: root

    required property HyprlandWorkspace workspace
    property bool active: false

    property var styles: active ? Theme.workspaces.active : Theme.workspaces.normal

    implicitWidth: styles.width
    implicitHeight: styles.height

    color: styles.color
    radius: styles.rounding

    Txt {
        anchors.centerIn: parent
        font.pixelSize: styles.fontSize
        color: styles.fontColor
        text: workspace.id
    }

    Behavior on implicitWidth {
        animation: NumberAnimation {
            target: root
            property: "implicitWidth"
            duration: 350
            easing.type: Easing.OutCubic
        }
    }

    Behavior on implicitHeight {
        animation: NumberAnimation {
            target: root
            property: "implicitHeight"
            duration: 50
            easing.type: Easing.OutSine
        }
    }

    Behavior on color {
        animation: ColorAnimation {
            target: root
            property: "color"
            duration: 350
            easing.type: Easing.OutSine
        }
    }
}
