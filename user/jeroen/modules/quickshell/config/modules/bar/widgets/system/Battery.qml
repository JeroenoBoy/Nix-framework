import Quickshell
import Quickshell.Services.UPower
import QtQuick
import QtQuick.Layouts

import "root:/theme"
import "root:/modules/bar/widgets"

BarItem {
    id: root

    readonly property var icons_charging: ["󰢟", "󰢜", "󰂆", "󰂇", "󰂈", "󰢝", "󰂉", "󰢞", "󰂊", "󰂋", "󰂅"]
    readonly property var icons_discharging: ["󰂎", "󱊡", "󰁻", "󰁼", "󰁽", "󰁾", "󰁿", "󰂀", "󰂁", "󰂂", "󰁹"]

    property UPowerDevice device: UPower.displayDevice

    readonly property bool showChargeIcon: device.state == UPowerDeviceState.Charging || device.state == UPowerDeviceState.PendingCharge || device.state == UPowerDeviceState.FullyCharged
    readonly property real percentage: device.percentage

    readonly property bool isWarn: percentage < 0.30
    readonly property bool isLow: percentage < 0.15
    readonly property bool isSuperCritical: percentage < 0.10

    readonly property var styles: isSuperCritical ? Theme.battery.crit : isLow ? Theme.battery.low : isWarn ? Theme.battery.warn : Theme.battery.normal

    Rectangle {
        anchors.fill: parent
        color: styles.color
        radius: parent.height / 2
    }

    Item {
        Layout.alignment: Qt.AlignHCenter
        implicitWidth: styles.padding * 2 + txt.implicitWidth
        height: parent.height

        Txt {
            id: txt
            x: styles.padding
            text: {
                let icon = (showChargeIcon ? icons_charging : icons_discharging)[Math.ceil(percentage * 10)];
                return icon + " " + Math.round(percentage * 100) + "%";
            }
        }
    }
}
