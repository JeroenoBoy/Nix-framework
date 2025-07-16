
{ pkgs, inputs, ... }:


{
  home.packages = with pkgs; [
    qt6.qtimageformats
    qt6.qt5compat
    qt6.qtmultimedia
    qt6.qtdeclarative
    inputs.quickshell.packages.${pkgs.system}.default
  ];

  home.file.".config/quickshell" = {
    source = ./config;
    recursive = true;
  };
}
