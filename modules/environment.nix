{pkgs, ...}:

{
  environment = {
    shells = with pkgs; [ zsh ];
    shellAliases = {
      "stegothewise" = "fortune | cowsay -f stegosaurus";
      "aquarium" = "asciiquarium";
      "pipes" = "pipes.sh -t 3";
    };

    variables = {
      EDITOR = "nvim";
      SYSTEM_EDITOR = "nvim";
      VISUAL = "nvim";
    };
    systemPackages = with pkgs; [
      home-manager
      fastfetch
      kitty btop
      ffmpeg
      brightnessctl
      xdg-desktop-portal
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-wlr
      networkmanager networkmanagerapplet
      p7zip

      #Very Important
      sl cowsay fortune asciiquarium
      pipes
    ];
  };
}