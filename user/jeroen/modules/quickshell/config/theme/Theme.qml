pragma Singleton
pragma ComponentBehavior: Bound

import Quickshell
import QtQuick

Singleton {
    id: root

    readonly property double scale: 1

    readonly property alias bg: bg
    readonly property alias txt: txt

    readonly property alias bar: bar
    readonly property alias battery: battery
    readonly property alias workspaces: workspaces

    Scope {
        id: bg
        readonly property color color: "#222233"
        readonly property color borderColor: "#3f3f4f"
        readonly property real borderWidth: 1 * root.scale
        readonly property real margin: 4 * root.scale
        readonly property real padding: 8 * root.scale
    }
    Scope {
        id: txt
        readonly property font font: ({
                family: "JetbrainsMono Nerd Font",
                pixelSize: 14 * root.scale
            })

        readonly property color color: "#ccccff"
    }

    Scope {
        id: bar
        readonly property real height: this.paddingY + txt.font.pixelSize * 1.8
        readonly property real rounding: height / 2
        readonly property real spacing: 16 * root.scale
        readonly property real paddingY: 8 * root.scale
        readonly property real paddingX: 16 * root.scale
    }

    Scope {
        id: battery

        readonly property alias normal: bat_normal
        readonly property alias warn: bat_warn
        readonly property alias low: bat_low
        readonly property alias crit: bat_crit

        Scope {
            id: bat_normal
            readonly property color color: "transparent"
            readonly property real padding: 0
        }

        Scope {
            id: bat_warn
            readonly property color color: "#aa5500"
            readonly property real padding: 8
        }

        Scope {
            id: bat_low
            readonly property color color: "#990022"
            readonly property real padding: 8
        }

        Scope {
            id: bat_crit
            readonly property color color: "#ff0022"
            readonly property real padding: 16
        }
    }

    Scope {
        id: workspaces

        readonly property real spacing: 4 * root.scale

        readonly property alias normal: wp_default
        readonly property alias active: wp_active

        Scope {
            id: wp_default
            readonly property color color: "#8888aa"
            readonly property real width: 32 * root.scale
            readonly property real height: bar.height / 4
            readonly property real rounding: height / 2
            readonly property real fontSize: height
            readonly property color fontColor: txt.color
        }

        Scope {
            id: wp_active
            readonly property color color: "#ccccff"
            readonly property real width: 64 * root.scale
            readonly property real height: bar.height / 3
            readonly property real rounding: height / 2
            readonly property real fontSize: height
            readonly property color fontColor: bg.color
        }
    }
}
