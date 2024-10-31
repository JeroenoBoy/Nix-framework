{pkgs, ...}: {
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
    gnome.nautilus
    gnome.sushi
    gnome.gnome-tweaks
    gnome.gnome-themes-extra
    gnome.gnome-boxes
    gnome-photos
    gnome.cheese
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

    vlc mpv yt-dlp
    jellyfin-media-player feishin
    spotify
    pwvucontrol
  ];
}
