import Quickshell
import Quickshell.Services.UPower
import QtQuick

import "root:/theme"
import "root:/widgets"

BarItem {
    id: root

    readonly property var icons_charging: ["󰢟", "󰢜", "󰂆", "󰂇", "󰂈", "󰢝", "󰂉", "󰢞", "󰂊", "󰂋", "󰂅"]
    readonly property var icons_discharging: ["󰂎", "󱊡", "󰁻", "󰁼", "󰁽", "󰁾", "󰁿", "󰂀", "󰂁", "󰂂", "󰁹"]

    property UPowerDevice device: UPower.displayDevice//UPower.devices.values.find(it => it.isLaptopBattery == true)

    readonly property bool showChargeIcon: device.state == UPowerDeviceState.Charging || device.state == UPowerDeviceState.PendingCharge || device.state == UPowerDeviceState.FullyCharged
    readonly property real percentage: device.percentage
    readonly property bool isWarn: percentage < 30
    readonly property bool isLow: percentage < 15
    readonly property bool isSuperCritical: percentage < 10

    readonly property var bg: isSuperCritical ? Theme.battery.critical : isLow ? Theme.battery.low : isWarn ? Theme.battery.warn : Theme.battery.normal

    Txt {
        id: txt
        text: {
            let icon = (showChargeIcon ? icons_charging : icons_discharging)[Math.ceil(percentage * 10)];
            return icon + " " + Math.round(percentage * 100) + "%";
        }
    }
}
