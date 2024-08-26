{pkgs, ...}: {
  home.packages = with pkgs; [
    mpvpaper
    font-manager
    wofi-emoji
    hypridle
    wcalc jq
    hyprshot
    thefuck
    playerctl

    jetbrains-toolbox
    devenv
    gh

    keepassxc
    thunderbird
    obs-studio
    gnome.nautilus
    gnome.gnome-tweaks
    gnome.gnome-themes-extra
    nicotine-plus
    webcord
    libnotify
    
    prismlauncher

    vlc
    jellyfin-media-player feishin sonixd
    spotify
  ];
}
