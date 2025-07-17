import Quickshell
import QtQuick

import "root:/services"
import "root:/theme"
import "root:/widgets"

BarItem {
    id: root

    Txt {
        text: " " + Math.ceil(ResourceStats.cpuTemp * 10000) / 100 + "%"
    }

    Txt {
        text: ResourceStats.cpuTempOut
    }
}
