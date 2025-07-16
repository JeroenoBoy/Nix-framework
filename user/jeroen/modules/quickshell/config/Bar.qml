import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layout

import qs.process
import qs.widgets

Scope {
    id: root
    property string time

    Variants {
        model: screens

        PanelWindow {
            property var modelData
            screen: modelData

            anchors {
                top: true
                left: true
                right: true
            }

            implicitHeight: 30

            RowLayout {
                anchors.centerIn: parent

                Text {
                    text: DateTime.date
                }
            }
        }
    }
}
