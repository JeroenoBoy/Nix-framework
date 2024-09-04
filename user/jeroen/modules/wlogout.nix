{...}:

{
  programs.wlogout = {
    enable = true;

    layout = [
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      } {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
      } {
        label = "logout";
        action = "loginctl kill-session $XDG_SESSION_ID";
        text = "Logout";
        keybind = "e";
      } {
        label = "sleep";
        action = "hyprlock && systemctl hibernate";
        text = "Sleep";
        keybind = "h";
      } {
        label = "lock";
        action = "hyprlock";
        text = "Lock";
        keybind = "l";
      }
    ];

    style = ''
      * {
        all: unset;
      }

      window {
        font-family: Fira Code Medium;
        font-size: 16pt;
        color:  @foreground; /* text */
        background-color: rgba(24, 27, 32, 0.2);
      } 

      button {
        background-repeat: no-repeat;
        background-position: center;
        background-size: 20%;
        background-color: transparent;
        transition: all 0.3s ease-in;
        box-shadow: 0 0 10px 2px transparent;
        border-radius: 36px;
        margin: 10px;
      }

      button:hover, button:focus {
        background-size: 50%;
        box-shadow: 0 0 10px 3px rgba(0,0,0,.2);
        background-color: rgba(255,255,255,0.2);
        color: transparent;
        transition: all 0.3s cubic-bezier(.55, 0.0, .28, 1.682), box-shadow 0.5s ease-in;
      }

      #lock {
        background-image: image(url("./icons/lock.png"));
      }

      #logout {
        background-image: image(url("./icons/logout.png"));
      }

      #sleep {
        background-image: image(url("./icons/sleep.png"));
      }

      #shutdown {
        background-image: image(url("./icons/shutdown.png"));
      }

      #reboot {
        background-image: image(url("./icons/reboot.png"));
      }
    '';
  };
}
