{ pkgs, version, config, inputs, ... }:

{
  imports = [ 
    ./modules
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Auto GC
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than=14d";
  };

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

  _module.args.pkgs-unstable = import inputs.nixpkgs-unstable {
    inherit (pkgs.stdenv.hostPlatform) system;
    inherit (config.nixpkgs) config;
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
    core-apps.enable = false;
  };

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.jeroen = {
    isNormalUser = true;
    description = "Jeroen";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
  };

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    "electron-31.7.7"
    "dotnet-sdk-6.0.428"
    "dotnet-runtime-6.0.36"
  ];

  programs.firefox.enable = true;
  programs.hyprland.enable = true;
  programs.ssh.enableAskPassword = false;

  programs.git = {
    enable = true;
    lfs.enable = true;
    prompt.enable = false;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  services.fprintd.enable = true;
  services.blueman.enable = true;
  services.libinput = {
    enable = true;
    touchpad.naturalScrolling = true;
  };
  services.printing.enable = true;
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  fonts.packages = with pkgs; [
    jetbrains-mono
  ] ++ builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);

  virtualisation.docker.enable = true;
  virtualisation.virtualbox = {
    host.enable = true;
    host.addNetworkInterface = false;
    guest.enable = true;
  };

  virtualisation.kvmgt.enable = true;
  virtualisation.libvirtd = {
    enable = true;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = version;
}
