import Quickshell
import "root:/modules/bar"

Scope {
    id: root
    Variants {
        model: Quickshell.screens
        Bar {
            property ShellScreen modelData
            screen: modelData
        }
    }
}
