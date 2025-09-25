import QtQuick

Item {
    id: root

    property real value: 0.5
    property real min: 0
    property real max: 1

    property color color: Theme.slider.background_default
    property color button_color: Theme.slider.button_color_default
    property color button_color_pressed: Theme.slider.button_color_pressed

    property bool is_pressed: false

    signal sliderValueChanged(real new_value)

    implicitHeight: 16

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true

        onPressed: {
            is_pressed = true;
        }
        onReleased: {
            is_pressed = false;
        }
        onMouseXChanged: {
            if (!is_pressed)
                return;

            root.value = Math.min(Math.max(this.mouseX / this.width, 0), 1) * (max - min) + min;
            root.sliderValueChanged(root.value);
        }
    }

    Rectangle {
        width: parent.width
        y: parent.y + 5
        height: 6
        radius: 3
        color: "grey"

        Rectangle {
            width: parent.width * (value - min) / (max - min)
            height: parent.height
            color: root.is_pressed ? root.button_color_pressed : root.button_color
            radius: this.height / 2
        }

        Rectangle {
            width: 16
            height: 16
            color: root.is_pressed ? root.button_color_pressed : root.button_color
            x: parent.width * (value - min) / (max - min) - (this.height - parent.height) / 2
            y: -(this.height - parent.height) / 2
            radius: this.height / 2
        }
    }
}
