
{ pkgs, inputs, ... }:


{
  home.packages = with pkgs; [
    kdePackages.qtdeclarative
    kdePackages.qt5compat
    kdePackages.qtsvg
    inputs.quickshell.packages.${pkgs.system}.default
  ];

  home.file.".config/quickshell" = {
    source = ./config;
    recursive = true;
  };

  qt.enable = true;
}
