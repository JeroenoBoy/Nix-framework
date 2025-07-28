import QtQuick

Btn {
    id: root
    required property string text

    size: Theme.button.icon
    implicitWidth: Theme.txt.xl.pixelSize * 2
    implicitHeight: Theme.txt.xl.pixelSize * 2

    Txt {
        anchors.centerIn: root
        font: Theme.txt.xl
        text: root.text
    }
}
