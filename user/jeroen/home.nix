{ config, pkgs, version, ... }:

{
  home.username = "jeroen";
  home.homeDirectory = "/home/jeroen";
  home.stateVersion = version; 
  
  nixpkgs.config.allowUnfree = true;

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
  };

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
