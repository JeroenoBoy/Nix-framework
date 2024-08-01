{ pkgs, ... }:

let
  system = "24.05";
  nixvim = import (builtins.fetchGit { url = "https://github.com/nix-community/nixvim"; ref="nixos-${system}"; });
in
{

  imports = [ 
    nixvim.nixosModules.nixvim
    <home-manager/nixos>
    ./hardware-configuration.nix
    ./modules
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable networking
  networking = {
    hostName = "LaiOS";
    networkmanager.enable = true;
    wireless.iwd.enable = true;
  };

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "nl_NL.UTF-8";
    LC_IDENTIFICATION = "nl_NL.UTF-8";
    LC_MEASUREMENT = "nl_NL.UTF-8";
    LC_MONETARY = "nl_NL.UTF-8";
    LC_NAME = "nl_NL.UTF-8";
    LC_NUMERIC = "nl_NL.UTF-8";
    LC_PAPER = "nl_NL.UTF-8";
    LC_TELEPHONE = "nl_NL.UTF-8";
    LC_TIME = "nl_NL.UTF-8";
  };

  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      options = "caps:escape";
    };

    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  services.gnome = {
    core-utilities.enable = false;
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.blueman.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jeroen = {
    isNormalUser = true;
    description = "Jeroen";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ ];
  };

  nixpkgs.config.allowUnfree = true;

  programs.firefox.enable = true;
  programs.hyprland.enable = true;
  programs.ssh.enableAskPassword = false;

  programs.git = {
    enable = true;
    lfs.enable = true;
    prompt.enable = false;
  };

  environment = {
    shells = with pkgs; [ zsh ];
    variables = {
      EDITOR = "nvim";
      SYSTEM_EDITOR = "nvim";
      VISUAL = "nvim";
    };
    systemPackages = with pkgs; [
      home-manager
      fastfetch
      kitty
      btop
      brightnessctl
      ffmpeg
      xdg-desktop-portal
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-wlr
      networkmanager networkmanagerapplet
    ];
  };

  services.fprintd.enable = true;
  services.libinput = {
    enable = true;
    touchpad.naturalScrolling = true;
  };

  fonts.packages = with pkgs; [
    nerdfonts
    jetbrains-mono
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = system; # Did you read the comment?

}
