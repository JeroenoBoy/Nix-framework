{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    mpvpaper
    hyprpaper # Switch between the 2
    font-manager
    wofi-emoji
    hypridle
    jq
    hyprshot
    playerctl
    alsa-utils
    rofi

    calc

    discord
    vesktop
    pandoc
    texliveFull
    r2modman

    jetbrains-toolbox
    jetbrains.idea-ultimate

    gh
    keepassxc
    thunderbird
    obs-studio
    libreoffice
    nicotine-plus
    libnotify
    krita
    brave
    arduino-ide
    unityhub
    aseprite
    godot
    godot-mono
    obsidian
    postman

    kdePackages.kdenlive
    kdePackages.qtwayland

    prismlauncher

    yt-dlp
    jellyfin-media-player
    feishin
    spotify
    pwvucontrol

    nautilus
    sushi
    gnome-tweaks
    gnome-themes-extra
    gnome-disk-utility
    gnome-boxes
    gnome-text-editor
    gnome-clocks
    seahorse
    eog
    totem
    cheese
    gnome-calculator
    gnomeExtensions.blur-my-shell
    #squirreldisk

    onlyoffice-desktopeditors

    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
  ];
}
