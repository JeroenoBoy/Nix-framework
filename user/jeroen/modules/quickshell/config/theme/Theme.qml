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
    readonly property alias startMenu: startMenu
    readonly property alias battery: battery
    readonly property alias workspaces: workspaces
    readonly property alias button: button

    readonly property color gray1: "#111122"
    readonly property color gray2: "#222233"
    readonly property color gray3: "#333344"
    readonly property color gray4: "#444455"
    readonly property color gray5: "#555566"
    readonly property color gray6: "#666677"
    readonly property color gray7: "#777788"
    readonly property color gray8: "#8888aa"

    readonly property color red1: "#990022"
    readonly property color red2: "#cc0022"
    readonly property color red3: "#ff0022"
    readonly property color yellow: "#aa5500"
    readonly property color blue1: "#0044bb"
    readonly property color blue2: "#0066dd"
    readonly property color green1: "#008866"
    readonly property color green2: "#00bb88"

    readonly property color bg1: root.gray1
    readonly property color bg2: root.gray2
    readonly property color bd1: root.gray2
    readonly property color txt1: "#ccccff"

    readonly property color warn: root.yellow
    readonly property color danger: root.red1
    readonly property color err: root.red3

    Scope {
        id: bg
        readonly property color color: root.bg1
        readonly property color borderColor: root.bd1
        readonly property real borderWidth: 1 * root.scale
        readonly property real margin: 4 * root.scale
        readonly property real padding: 8 * root.scale
    }

    Scope {
        id: txt
        readonly property font xl: ({
                family: "JetbrainsMono Nerd Font",
                pixelSize: 20 * root.scale
            })

        readonly property font lg: ({
                family: "JetbrainsMono Nerd Font",
                pixelSize: 16 * root.scale
            })

        readonly property font md: ({
                family: "JetbrainsMono Nerd Font",
                pixelSize: 14 * root.scale
            })

        readonly property font sm: ({
                family: "JetbrainsMono Nerd Font",
                pixelSize: 10 * root.scale
            })

        readonly property color primary: root.txt1
        readonly property color muted: root.gray8
    }

    Scope {
        id: bar
        readonly property real height: this.paddingY + root.txt.md.pixelSize * 1.8
        readonly property real rounding: 10 * root.scale
        readonly property real opacity: 0.9
        readonly property real spacing: 16 * root.scale
        readonly property real paddingY: 8 * root.scale
        readonly property real paddingX: 12 * root.scale
    }

    Scope {
        id: startMenu
        readonly property real width: 500 * root.scale
        readonly property real opacity: 0.98
        readonly property real spacing: 12 * root.scale
        readonly property real padding: 12 * root.scale

        readonly property alias profile: profile

        Scope {
            id: profile
            readonly property color bg: root.bg2
        }
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
            readonly property color color: root.warn
            readonly property real padding: 8
        }

        Scope {
            id: bat_low
            readonly property color color: root.danger
            readonly property real padding: 8
        }

        Scope {
            id: bat_crit
            readonly property color color: root.err
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
            readonly property color color: root.gray8
            readonly property real width: 32 * root.scale
            readonly property real height: bar.height / 4
            readonly property real rounding: height / 2
            readonly property real fontSize: height
            readonly property color fontColor: root.txt.primary
        }

        Scope {
            id: wp_active
            readonly property color color: root.txt1
            readonly property real width: 64 * root.scale
            readonly property real height: bar.height / 3
            readonly property real rounding: height / 2
            readonly property real fontSize: height
            readonly property color fontColor: bg.color
        }
    }

    Scope {
        id: button

        readonly property alias md: btn_md
        readonly property alias lg: btn_lg
        readonly property alias icon: btn_icon

        readonly property alias normal: btn_normal
        readonly property alias danger: btn_danger
        readonly property alias blue: btn_blue
        readonly property alias green: btn_green

        Scope {
            id: btn_md

            readonly property real radius: 8 * root.scale
            readonly property real paddingX: 12 * root.scale
            readonly property real paddingY: 8 * root.scale
        }

        Scope {
            id: btn_lg

            readonly property real radius: btn_md.radius * 1.5
            readonly property real paddingX: btn_md.paddingX * 1.5
            readonly property real paddingY: btn_md.paddingY * 1.5
        }

        Scope {
            id: btn_icon

            readonly property real radius: 8 * root.scale
            readonly property real paddingX: 0
            readonly property real paddingY: 0
        }

        Scope {
            id: btn_normal
            readonly property color bg: root.gray4
            readonly property color hovered: root.gray5
            readonly property color pressed: root.gray6
            readonly property real opacity: 0.8
        }

        Scope {
            id: btn_danger
            readonly property color bg: root.gray4
            readonly property color hovered: root.red1
            readonly property color pressed: root.red2
            readonly property real opacity: 0.8
        }

        Scope {
            id: btn_blue
            readonly property color bg: root.gray4
            readonly property color hovered: root.blue1
            readonly property color pressed: root.blue2
            readonly property real opacity: 0.8
        }

        Scope {
            id: btn_green
            readonly property color bg: root.gray4
            readonly property color hovered: root.green1
            readonly property color pressed: root.green2
            readonly property real opacity: 0.8
        }
    }
}
