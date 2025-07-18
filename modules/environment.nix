{pkgs, inputs, system, ...}:

{
  environment = {
    shells = with pkgs; [ zsh ];
    shellAliases = {
      "stegothewise" = "fortune | cowsay -f stegosaurus";
      "aquarium" = "asciiquarium";
      "pipes" = "pipes.sh -t 3";
      "awp" = "sh $HOME/.sh/add_wallpaper.sh";
      "n" = "nvim .";
      "lg" = "lazygit";
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
      lazygit
      zoxide

      inputs.zen-browser.packages."${system}".beta

      #Very Important
      sl cowsay fortune asciiquarium pipes cava

      # Other things, for the DAP
      elixir-ls
    ];
  };
}
