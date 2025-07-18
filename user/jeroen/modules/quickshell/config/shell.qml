import Quickshell

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
