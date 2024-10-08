{ config, pkgs, ... }:

let
  username = "jeroen";
in
{
  imports = [
    ./pkgs.nix
    ./modules
  ];

  nixpkgs.config.allowUnfree = true;

  home.username = username;
  home.homeDirectory = "/home/jeroen";
  home.stateVersion = "24.05"; 

  home.file = {
    ".config/hypr/hyprland.conf".source = conf/hyprland.conf;
    ".config/electron-flags.conf".source = conf/electron-flags.conf;
    ".sh/" = {
      source = ./shell;
      recursive = true;
    };
    ".assets/" = {
      source = ./assets;
      recursive = true;
    };
    ".config/rofi" = {
      source = ./conf/rofi;
      recursive = true;
    };
    ".config/wlogout/icons" = {
      source = ./assets/icons;
      recursive = true;
    };
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
