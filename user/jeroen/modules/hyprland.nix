{pkgs, ...}:

{
  wayland.windowManager.hyprland = {
    enable = true;
    plugins = with pkgs; [
      hyprlandPlugins.hyprbars
      hyprlandPlugins.hyprexpo
    ];

    settings = {
      "$mainMod" = "SUPER";
      "$terminal" = "kitty";
      "$fileManager" = "nautilus ~";
      "$menu" = "pkill rofi; rofi -show drun -show-icons -terminal kitty";
      "$menu-window" = ''pkill rofi; rofi -show window -show-icons -config "~/.config/rofi/themes/windows.rasi"'';
      "$emoji" = "wofi-emoji --show drun";
      "$browser" = "firefox";

      monitor = [
        "eDP-1,preferred,auto,1.875"
        ",preferred,auto,1"
        ",1920x1080,auto,1"
        ",3840x2160,auto,2"
      ];

      exec-once = [
        "eww open topbar; nm-applet & blueman-applet"
        "swaync"
        "keepassxc"
        "sh ~/.sh/wallpaper.sh --listen"
      ];

      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];

      general = { 
          gaps_in = 3;
          gaps_out = "5,5,5,5";
          border_size = 2;
          "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
          "col.inactive_border" = "rgba(595959aa)";

          resize_on_border = true;
          allow_tearing = false;
          layout = "dwindle";
      };

      decoration = {
          rounding = 10;

          active_opacity = 1.0;
          inactive_opacity = .97;

          drop_shadow = true;
          shadow_range = 4;
          shadow_render_power = 3;
          "col.shadow" = "rgba(1a1a1aee)";

          blur = {
              enabled = true;
              size = 6;
              passes = 2;
              vibrancy = 0.1696;
          };
      };

      group = {
          "col.border_active" = "rgba(00ff99ee) rgba(33ccffee) 45deg";
          "col.border_inactive" = "rgba(595959aa)";
          groupbar = {
              font_size = 10;
              "col.active" = "rgba(00ff99aa)";
              "col.inactive" = "rgba(00ee7733)";
          };
      };

      animations = {
          enabled = true;
          bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
          animation = [
            "windows, 1, 7, myBezier"
            "windowsOut, 1, 7, default, popin 80%"
            "border, 1, 10, default"
            "borderangle, 1, 8, default"
            "fade, 1, 7, default"
            "workspaces, 1, 6, default"
          ];
      };

      dwindle = {
          pseudotile = true;
          preserve_split = true;
      };

      master = {
          new_status = "master";
      };

      misc = { 
          force_default_wallpaper = 0;
          disable_hyprland_logo = true;
      };

      xwayland = {
          use_nearest_neighbor = false;
          #force_zero_scaling = true;
      };

      plugin = {
        hyprexpo = {
          columns = 3;
          gap_size = 5;
          bg_col = "rgb(111111)";
          workspace_method = "center current";

          enable_gesture = true;
          gesture_fingers = 3;
          gesture_distance = 300;
          gesture_positive = true;
        };
        hyprbars = {
          bar_height = 20;

          bar_part_of_window = false;
          bar_title_enabled = true;
          bar_color = "rgba(33ccffee)";

          hyprbars-button = [
            "rgb(ff4040), 10, 󰖭, hyprctl dispatch killactive"
            "rgb(eeee11), 10, , hyprctl dispatch fullscreen 1"
          ];
        };
      };

      input = {
          kb_layout = "us";
          kb_variant = "";
          kb_model = "";
          kb_options = "caps:escape";
          kb_rules = "";

          follow_mouse = 1;

          sensitivity = 0;
          force_no_accel = true;

          touchpad = {
              natural_scroll = true;
              scroll_factor = 0.5;
          };
      };

      gestures = {
          workspace_swipe = true;
      };

      device = {
          name = "epic-mouse-v1";
          sensitivity = -0.5;
      };

      bind = [
        "$mainMod, mouse:272, movewindow"
        #"$mainMod ALT, mouse:272, resizewindow"
        "$mainMod CONTROL, SUPER_L, exec, eww open --toggle start_menu-closer; eww open --toggle start_menu"

        "$mainMod, Q, exec, $terminal"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, SPACE, exec, $menu"
        "$mainMod, W, exec, $menu-window"
        "$mainMod SHIFT, W, exec, sh ~/.sh/switch_wallpaper.sh"
        "$mainMod, O, exec, $emoji"
        "$mainMod, B, exec, $browser"
        "$mainMod, P, exec, hyprlock"
        "$mainMod, X, exec, wlogout -b 5 -T 380 -B 380 -R 64 -L 64"
        "$mainMod SHIFT, R, exec, sh ~/.sh/hyprreload.sh"
        "$mainMod, C, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, V, togglefloating,"
        "$mainMod, N, togglesplit, # dwindle"
        "$mainMod, F, fullscreen"

        ", PRINT, exec, hyprshot -m region"
        "$mainMod, PRINT, exec, hyprshot -m window"
        "$mainMod SHIFT, print, exec, hyprshot -m output"

        # Window navigation

        "$mainMod, H, movefocus, l"
        "$mainMod, L, movefocus, r"
        "$mainMod, K, movefocus, u"
        "$mainMod, J, movefocus, d"

        "$mainMod SHIFT, H, moveWindow, l"
        "$mainMod SHIFT, L, moveWindow, r"
        "$mainMod SHIFT, K, moveWindow, u"
        "$mainMod SHIFT, J, moveWindow, d"

        "$mainMod SHIFT ALT, H, resizeactive, -50 0"
        "$mainMod SHIFT ALT, L, resizeactive, 50 0"
        "$mainMod SHIFT ALT, K, resizeactive, 0 -30"
        "$mainMod SHIFT ALT, J, resizeactive, 0 30"
        "$mainMod ALT, H, resizeactive, -150 0"
        "$mainMod ALT, L, resizeactive, 150 0"
        "$mainMod ALT, K, resizeactive, 0 -90"
        "$mainMod ALT, J, resizeactive, 0 90"

        # Groups

        "$mainMod, g, togglegroup"
        "$mainMod SHIFT, g, moveoutofgroup"
        "$mainMod SHIFT, TAB, changegroupactive, b"
        "$mainMod, TAB, changegroupactive, f"

        # Workspaces

        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"
      ];
      bindl = [
        ", XF86MonBrightnessUp, exec, brightnessctl set +5%"
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"

        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
        ", XF86AudioNext, exec, playerctl next"
      ];

      bindle = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%-"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      windowrule = [
        "float, blueman-manager"
        "float, Calculator"
      ];

      windowrulev2 = [
        "plugin:hyprbars:nobar, floating:0"
        "suppressevent maximize, class:.*"
        "bordercolor rgba(aa4455ee), xwayland:1"
      ];

      layerrule = [
        "blur, logout_dialog"
        "blur, rofi"
      ];
    };
  };
}
