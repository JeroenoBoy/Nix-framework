{pkgs, ...}: {
  home.packages = with pkgs; [
    mpvpaper
    font-manager
    wofi-emoji
    hypridle
    wcalc
    hyprshot
    thefuck

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
    jellyfin-media-player
    spotify spotdl
  ];
}
