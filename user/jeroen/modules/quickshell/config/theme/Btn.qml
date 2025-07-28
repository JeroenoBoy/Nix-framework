import QtQuick
import QtQuick.Layouts

MouseArea {
    id: root
    property var style: Theme.button.normal
    property var size: Theme.button.md
    property color cBackground: style.bg
    property color cHovered: style.hovered
    property color cPressed: style.pressed

    default property alias children: items.children

    implicitWidth: items.implicitWidth + size.paddingX * 2
    implicitHeight: items.implicitHeight + size.paddingY * 2

    hoverEnabled: true

    Rectangle {
        id: rect
        anchors.fill: parent
        radius: size.radius

        color: root.pressed ? root.cPressed : root.containsMouse ? root.cHovered : root.cBackground
        opacity: root.style.opacity

        Behavior on color {
            ColorAnimation {
                property: "color"
                target: rect
                duration: 100
                easing.type: Easing.OutSine
            }
        }
    }

    ColumnLayout {
        id: items
        anchors.centerIn: parent
        x: root.size.paddingX
        y: root.size.paddingY
    }
}
