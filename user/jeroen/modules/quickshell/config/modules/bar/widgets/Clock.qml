import QtQuick
import "root:/theme"

BarItem {
    required property bool showSeconds
    required property var time
    Txt {
        text: Qt.formatDateTime(time, showSeconds ? "dddd dd MMMM hh:mm:ss" : "ddd dd MMM hh:mm")
    }
}
