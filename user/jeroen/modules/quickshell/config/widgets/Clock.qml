import QtQuick
import "root:/theme"

Txt {
    required property var time
    text: Qt.formatDateTime(clock.date, "ddd dd MMM hh:mm")
}
