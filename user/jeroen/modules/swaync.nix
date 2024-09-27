{...}:

{
  services.swaync = {
    enable = true;
    settings = {
      control-center-margin-top = 5;
      control-center-margin-right = 5;
      control-center-margin-bottom = 5;
      timeout = 5;
      timeout-low = 5;
      timeout-critical = 0;
      widgets = ["inhibitors" "menubar" "title" "dnd" "volume" "mpris" "notifications"];
    };
    style = ''
      * {
        box-shadow: unset;
      }

      .control-center, .notification {
        background: #222233;
        border-radius: 10px;
        border: 1px solid rgba(255, 255, 255, 0.2);
      }

      .control-center {
        box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.2), 0 4px 6px -4px rgba(0, 0, 0, 0.2);
      }

      .control-center .notification {
        background: #222233;
        border-radius: 10px;
        border: 1px solid rgba(255, 255, 255, 0.2);
        box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.2), 0 4px 6px -4px rgba(0, 0, 0, 0.2);
      }
      
      .widget-mpris-player {
        box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.2), 0 4px 6px -4px rgba(0, 0, 0, 0.2);
      }

      .notification-group, notification-row, .notification-background {
        background: transparent;
        /* background: red; */
      }
    '';
  };
}
