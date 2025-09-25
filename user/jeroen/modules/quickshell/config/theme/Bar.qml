import QtQuick

Item {
    id: slider

    property real value: 0.5
    property real min: 0
    property real max: 1

    implicitHeight: 40

    Rectangle {
        width: parent.width
        height: 6
        radius: 3
        color: "grey"

        Rectangle {
            width: parent.width * (value - min) / (max - min)
            height: parent.height
            color: "red"
            radius: this.height / 2
        }
    }
}
