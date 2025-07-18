import QtQuick
import "root:/theme"

BarItem {
    required property var time
    Txt {
        text: Qt.formatDateTime(time, "ddd dd MMM hh:mm")
    }
}
