{...}:

{
  services.swaync = {
    enable = true;
    settings = {
      control-center-margin-top = 5;
      control-center-margin-right = 15;
      control-center-margin-bottom = 15;
      timeout = 5;
      timeout-low = 5;
      timeout-critical = 0;
      widgets = ["inhibitors" "menubar" "title" "dnd" "volume" "mpris" "notifications"];
    };
    style = ''
      .control-center, .notification {
        border: double 2px transparent;
        border-radius: 10px;
        /* opacity: 0.8; */
        background-image: linear-gradient(45deg,#144,#226), linear-gradient(135deg, #33ccff, #00ff99);
        background-origin: border-box;
        background-clip: content-box, border-box;
      }

      .control-center .notification {
        border: none;
        border-radius: 10px;
        background: #114;
        background-image: unset;
        background-origin: unset;
        background-clip: unset;
      }

      .notification-group, notification-row, .notification-background {
        background: transparent;
        /* background: red; */
      }
    '';
  };
}
