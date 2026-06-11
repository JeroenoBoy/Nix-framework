
local emoji = "wofi-emoji --show drun"
local fileManager = "nautilus ~"
local mainMod = "SUPER"
local menu = "pkill rofi; rofi -show drun -show-icons -terminal kitty"
local menu_window = "pkill rofi; rofi -show window -show-icons -config \"~/.config/rofi/themes/windows.rasi\""
local terminal = "kitty"

hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })
hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 7,
    bezier = "myBezier",
})
hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 7,
    bezier = "default",
    style = "popin 80%",
})
hl.animation({
    leaf = "border",
    enabled = true,
    speed = 10,
    bezier = "default",
})
hl.animation({
    leaf = "borderangle",
    enabled = true,
    speed = 8,
    bezier = "default",
})
hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 7,
    bezier = "default",
})
hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 6,
    bezier = "default",
})

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mainMod .. " + CONTROL + SUPER_L", hl.dsp.global("quickshell:toggle_start_menu"))
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(menu .. "-window"))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("sh ~/.sh/switch_wallpaper.sh"))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd(emoji))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd("wlogout -b 5 -T 380 -B 380 -R 64 -L 64"))
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("sh ~/.sh/hyprreload.sh"))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exit())
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + N", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind(mainMod .. " + SHIFT + print", hl.dsp.exec_cmd("hyprshot -m output"))
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction="left" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction="down" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction="up" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction="right" }))
hl.bind(mainMod .. " + SHIFT + ALT + H", hl.dsp.window.resize({ x = -50, y = 0, relative = true }))
hl.bind(mainMod .. " + SHIFT + ALT + L", hl.dsp.window.resize({ x = 50, y = 0, relative = true }))
hl.bind(mainMod .. " + SHIFT + ALT + K", hl.dsp.window.resize({ x = 0, y = -30, relative = true }))
hl.bind(mainMod .. " + SHIFT + ALT + J", hl.dsp.window.resize({ x = 0, y = 30, relative = true }))
hl.bind(mainMod .. " + ALT + H", hl.dsp.window.resize({ x = -150, y = 0, relative = true }))
hl.bind(mainMod .. " + ALT + L", hl.dsp.window.resize({ x = 150, y = 0, relative = true }))
hl.bind(mainMod .. " + ALT + K", hl.dsp.window.resize({ x = 0, y = -90, relative = true }))
hl.bind(mainMod .. " + ALT + J", hl.dsp.window.resize({ x = 0, y = 90, relative = true }))
hl.bind(mainMod .. " + g", hl.dsp.group.toggle())
hl.bind(mainMod .. " + SHIFT + g", hl.dsp.window.move({ out_of_group = true }))
hl.bind(mainMod .. " + SHIFT + TAB", hl.dsp.group.prev())
hl.bind(mainMod .. " + TAB", hl.dsp.group.next())
hl.bind(mainMod .. " + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind(mainMod .. " + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind(mainMod .. " + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind(mainMod .. " + 9", hl.dsp.focus({ workspace = 9 }))
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = 10 }))
hl.bind(mainMod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind(mainMod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind(mainMod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind(mainMod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind(mainMod .. " + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind(mainMod .. " + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }))
hl.bind(mainMod .. " + SHIFT + 7", hl.dsp.window.move({ workspace = 7 }))
hl.bind(mainMod .. " + SHIFT + 8", hl.dsp.window.move({ workspace = 8 }))
hl.bind(mainMod .. " + SHIFT + 9", hl.dsp.window.move({ workspace = 9 }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))
hl.bind("mouse:274", hl.dsp.exec_cmd(""))

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set +5%"), { locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"), { locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize())

hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.500000,
})

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "rose-pine-hyprcursor")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")
hl.env("NIXOS_OZONE_WL", "1")
hl.env("XWAYLAND_SCALE", "2")

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})

hl.layer_rule({
    match = { namespace = "logout_dialog" },
    blur = true,
})

hl.layer_rule({
    match = { namespace = "rofi" },
    blur = true,
})

hl.monitor({
    output = "eDP-1",
    mode = "2880x1920@60",
    position = "auto",
    scale = "1.875",
})

hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = "1",
})

hl.monitor({
    output = "",
    mode = "1920x1080",
    position = "auto",
    scale = "1",
})

hl.monitor({
    output = "",
    mode = "3840x2160",
    position = "auto",
    scale = "2",
})

hl.window_rule({
    match = {
        class = "class:blueman-manager",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = "class:Calculator",
    },
    float = true,
})

hl.window_rule({
    match = {
        class = ".*",
    },
    suppress_event = "maximize",
})

hl.window_rule({
    match = {
        xwayland = 1,
    },
    border_color = "rgba(aa4455ee)",
})

hl.config({
    animations = {
        enabled = true,
    },
    decoration = {
        blur = {
            enabled = true,
            passes = 2,
            size = 6,
            vibrancy = 0.169600,
        },
        shadow = {
            color = "rgba(1a1a1aee)",
            range = 4,
            render_power = 3,
        },
        active_opacity = 1.000000,
        inactive_opacity = 0.970000,
        rounding = 10,
    },
    master = {
        mfact = 0.75,
    },
    general = {
        allow_tearing = false,
        border_size = 2,
        col = {
            active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },
        gaps_in = 3,
        gaps_out = {
            left = 5,
            down = 5,
            up = 5,
            right = 5
        },
        layout = "master",
        resize_on_border = true,
    },
    group = {
        groupbar = {
            col = {
                active = "rgba(00ff99aa)",
                inactive = "rgba(00ee7733)",
            },
            enabled = true,
            font_size = 12,
            height = 14,
            indicator_gap = -14,
            indicator_height = 16,
            rounding = 16,
        },
        col = {
            border_active = { colors = { "rgba(00ff99ee)", "rgba(33ccffee)" }, angle = 45 },
            border_inactive = "rgba(595959aa)",
        },
    },
    input = {
        touchpad = {
            natural_scroll = true,
            scroll_factor = 0.250000,
        },
        follow_mouse = 1,
        force_no_accel = true,
        kb_layout = "us",
        kb_model = "",
        kb_options = "caps:escape",
        kb_rules = "",
        kb_variant = "",
        sensitivity = 0,
    },
    misc = {
        disable_hyprland_logo = true,
        force_default_wallpaper = 0,
    },
    xwayland = {
        force_zero_scaling = true,
        use_nearest_neighbor = false,
    },
})

hl.on("hyprland.start", function()
    hl.exec_cmd("/nix/store/ai8mmqghspvnhv2jz12pfg6b6dqmg3b3-dbus-1.16.2/bin/dbus-update-activation-environment --systemd DISPLAY HYPRLAND_INSTANCE_SIGNATURE WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE && systemctl --user stop hyprland-session.target && systemctl --user start hyprland-session.target")
    hl.exec_cmd("eww open topbar; nm-applet & blueman-applet")
    hl.exec_cmd("swaync")
    hl.exec_cmd("keepassxc")
    hl.exec_cmd("sh ~/.sh/wallpaper.sh --listen")
    hl.exec_cmd("quickshell")
end)

