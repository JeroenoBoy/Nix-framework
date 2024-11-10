{pkgs, inputs, ...}: {
  home.packages = with pkgs; [
    mpvpaper hyprpaper # Switch between the 2
    font-manager
    wofi-emoji
    hypridle
    wcalc jq
    hyprshot
    thefuck
    playerctl
    alsa-utils
    rofi-wayland

    discord vesktop
    pandoc texliveFull

    jetbrains-toolbox
    devenv
    gh
    keepassxc
    thunderbird
    obs-studio

    # Gnome stuff
    nautilus
    sushi
    gnome-tweaks
    gnome-themes-extra
    gnome-boxes
    eog
    totem
    cheese
    gnome-calculator

    libreoffice
    nicotine-plus
    libnotify
    krita
    brave
    arduino-ide
    unityhub

    kdePackages.kdenlive
    kdePackages.qtwayland

    prismlauncher

    yt-dlp
    jellyfin-media-player feishin
    spotify
    pwvucontrol

    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
  ];
}
