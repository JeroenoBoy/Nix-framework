import Quickshell
import QtQuick

import "root:/services"
import "root:/theme"
import "root:/widgets"

BarItem {
    id: root

    Txt {
        text: "  " + Math.ceil(ResourceStats.diskPerc * 100) + "%"
    }
}
