import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import Quickshell.Services.SystemTray

MouseArea {
    id: root

    required property SystemTrayItem item
    required property PanelWindow panel
    property double trayItemWidth

    acceptedButtons: Qt.LeftButton | Qt.RightButton

    Layout.fillHeight: true
    implicitWidth: trayItemWidth

    onPressed: evt => {
        switch (evt.button) {
        case Qt.LeftButton:
            item.activate();
            break;
        case Qt.RightButton:
            if (item.hasMenu) {
                showMenu.active = true;
                showMenu.item.open();
            }
            break;
        }
    }

    IconImage {
        id: icon
        source: root.item.icon
        anchors.centerIn: parent
        width: parent.width
        height: parent.height
    }

    LazyLoader {
        id: showMenu
        component: QsMenuAnchor {
            menu: item.menu

            readonly property point itemPosition: panel.contentItem.mapFromItem(icon, 0, 0)

            anchor.window: panel
            anchor.rect.x: itemPosition.x
            anchor.rect.y: itemPosition.y + icon.height + 4 * root.scale
            anchor.edges: Edges.Bottom

            onClosed: showMenu.active = false
        }
    }
}
