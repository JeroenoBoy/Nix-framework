import Quickshell
import QtQuick

import "root:/services"
import "root:/theme"
import "root:/modules/bar/widgets"

BarItem {
    id: root

    Txt {
        text: "  " + Math.ceil(ResourceStats.cpuUsage * 10000) / 100 + "%"
    }
}
