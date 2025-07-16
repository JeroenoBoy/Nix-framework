{ config, pkgs, version, inputs, ... }:

let
  username = "jeroen";
in
{
  imports = [
    ./pkgs.nix
    ./modules
  ];

  nixpkgs.config.allowUnfree = true;

  _module.args.pkgs-unstable = import inputs.nixpkgs-unstable {
    inherit (pkgs.stdenv.hostPlatform) system;
    inherit (config.nixpkgs) config;
  };

  home.username = username;
  home.homeDirectory = "/home/jeroen";
  home.stateVersion = version; 

  home.file = {
    ".config/electron-flags.conf".source = conf/electron-flags.conf;
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
    ".config/quickshell" = {
      source = ./conf/quickshell;
      recursive = true;
    };
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
