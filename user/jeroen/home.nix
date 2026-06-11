{
  config,
  pkgs,
  version,
  inputs,
  ...
}:

let
  username = "jeroen";
in
{
  imports = [
    ./pkgs.nix
    ./modules
  ];

  home.username = username;
  home.homeDirectory = "/home/jeroen";
  home.stateVersion = version;

  home.file = {
    ".config/electron-flags.conf".source = conf/electron-flags.conf;
    ".config/hypr/hyprland.lua".source = conf/hyprland.lua;
    ".sh/" = {
      source = ./shell;
      recursive = true;
    };
    ".assets/icons" = {
      source = ./assets;
      recursive = true;
    };
    ".assets/random.jpg".source = ./assets/random.jpg;
    "Documents/Wallpapers/LaiOS" = {
      source = ./assets/wallpapers;
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
    "NIXOS_OZONE_WL" = "1";
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
