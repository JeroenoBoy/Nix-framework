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

    jetbrains-toolbox
    devenv
    gh

    keepassxc
    thunderbird
    obs-studio
    gnome.nautilus
    gnome.gnome-tweaks
    gnome.gnome-themes-extra
    gnome-photos
    gnome.cheese
    nicotine-plus
    libnotify
    krita
    
    prismlauncher

    vlc mpv yt-dlp
    jellyfin-media-player feishin
    spotify
  ];
}
