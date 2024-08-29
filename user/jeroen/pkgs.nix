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

    discord

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
    libnotify
    
    prismlauncher

    vlc
    jellyfin-media-player feishin sonixd
    spotify
  ];
}
