{...}:

    
let 
  bg-color = "#222233";
  border-radius = "30px";
  font-color = "#ccccff";
in
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        margin-right = 20;
        margin-left = 20;
        margin-top = 5;
        margin-bottom = 0;

        modules-left = [ "battery" "memory" "cpu" "disk" "temperature" ];
        modules-center = [ "hyprland/workspaces" ];
        modules-right = [ "tray" "clock" "custom/notification" ];

        "temperature" = {
          critical-threshold = 60;
          format = "{icon} {temperatureC}°C";
          format-icons = [ "" "" "" "" "" ];
        };

        "disk" = {
          format = "    {percentage_used}%";
        };

        "cpu" = {
          format = "    {load}%";
        };

        "memory" = {
          format = "    {percentage}%";
        };

        "battery" = {
          states = {
            "warn" = 30;
            "crit" = 15;
            "supercrit" = 5;
          };
          format = "{icon} {capacity}%";
          format-icons = {
            default = [ "󰂎" "󱊡" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
            charging = [ "󰢟 " "󰢜 " "󰂆 " "󰂇 " "󰂈 " "󰢝 " "󰂉 " "󰢞 " "󰂊 " "󰂋 " "󰂅 " ];
          };
        };

        "bluetooth" = {
          format = "󰂲";
          format-off = "󰂲";
          format-on = "";
          format-connected = "󰂱";
          on-click = "blueman-manager";
        };
      

        "network" = {
          tooltip = false;
          format-wifi = "{icon}";
          format-ethernet = "";
          format-disconnected = "󰤮";
          format-icons = [ "󰤯 " "󰤟 " "󰤢 " "󰤨 " ];
          on-click = "iwgtk";
        };
          
        "clock" = {
          format = "{:%a %d %b %H:%M}";
        };

        "tray" = {
          spacing = 8;
        };
        
        "custom/notification" = {
          tooltip = false;
          format = "{icon}";
          format-icons = {
            "notification" = "<span foreground='red'><sup></sup></span>";
            "none" = "";
            "dnd-notification" = "<span foreground='red'><sup></sup></span>";
            "dnd-none" = "";
            "inhibited-notification" = "<span foreground='red'><sup></sup></span>";
            "inhibited-none" = "";
            "dnd-inhibited-notification" = "<span foreground='red'><sup></sup></span>";
            "dnd-inhibited-none" = "";
          };
          return-type = "json";
          exec-if = "which swaync-client";
          exec = "swaync-client -swb";
          on-click = "swaync-client -t -sw";
          on-click-right = "swaync-client -d -sw";
          escape = true;
        };

        "hyprland/workspaces" = {
          format = "";
        };
      };
    };

    style = ''
      * {
        color: ${font-color};
        min-height: 0px;
      }

      .module {
        margin: 0px 6px;
        margin-top: 6px;
        margin-bottom: 6px;
        border-radius: 30px;
        border-radius: 30px;
        padding: 0px 0px;
        transition: all .3s ease-out;
      }

      button.module:hover {
        background-color: ${font-color};
      }

      window#waybar {
        background: rgba(0,0,0,0);
        border-radius: 10px;
      }

      .modules-right, .modules-left, .modules-center {
        background-color: ${bg-color};
        border-radius: ${border-radius};
        border: 1px solid rgba(255, 255, 255, 0.2);
      }

      .modules-left, .modules-right {
        padding-right: 10px;
        padding-left: 10px;
      }

      .warn {
        padding: 0px 4px;
        background-color: #aa5500;
      }
      
      .crit, .critical {
        padding: 0px 4px;
        background-color: #990022;
      }

      .supercrit {
        padding: 0px 16px;
        background-color: #ff0022;
        color: white;
      }

      #workspaces {
        margin: 0 0;
        padding: 10px 6px;
        font-size: 0px;
      }
      
      #workspaces button {
        margin-left: 4px;
        margin-right: 4px;
        padding-left: 20px;
        padding-right: 0;
        border-radius: 14px;
        background-color: #8888aa;
        
        transition: all .25s ease-out;
      }

      #workspaces button.active {
        padding-left: 50px;
        background-color: ${font-color};
      }
    '';
  };
}
