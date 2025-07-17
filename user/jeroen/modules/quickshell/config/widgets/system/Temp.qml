import Quickshell
import QtQuick

import "root:/services"
import "root:/theme"
import "root:/widgets"

BarItem {
    id: root

    Txt {
        text: " " + Math.round(ResourceStats.cpuTemp) + "°C"
    }

    Txt {
        text: ResourceStats.cpuTempOut
    }
}
