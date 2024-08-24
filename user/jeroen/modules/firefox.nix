{pkgs, ...}:

{
  home.file.".mozilla/firefox/default/chrome" = {
    source = ../assets/chrome;
    recursive = true;
  };
  programs.firefox = {
    enable = true;
    policies = {
      DisableTelemetry = true;
      FirefoxHome = {
        TopSites = false;
      };
    };

    profiles.default = {
      id = 0;
      isDefault = true;
      search.default = "DuckDuckGo";

      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "extensions.autoDisableScopes" = 0;
      };

      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        vimium
        keepassxc-browser
      ];

      bookmarks = [
        {
          name = "Nix sites";
          toolbar = true;
          bookmarks = [
            {
              name = "MyNixOs";
              url = "https://mynixos.com/";
            }
            {
              name = "Nix Search";
              url = "https://search.nixos.org";
            }
            {
              name = "Nerd fonts";
              url = "https://www.nerdfonts.com/cheat-sheet";
            }
          ];
        }
        {
          name = "Mini-chan";
          toolbar = true;
          bookmarks = [
            {
              name = "Mini-chan";
              url = "http://192.168.178.26:82";
            }
            {
              name = "Syncthing - Mini-chan";
              url = "http://192.168.178.26:8384";
            }
            {
              name = "Jellyfin";
              url = "https://watch.at.minichan.moe";
            }
            {
              name = "Authentik";
              url = "https://login.at.minichan.moe";
            }
          ];
        }
        {
          name = "LaiOS";
          toolbar = true;
          bookmarks = [
            {
              name = "Syncthing - LaiOS";
              url = "http://localhost:8384/";
            }
          ];
        }
        {
          name = "Syncthing - LaiOS";
          url = "http://127.0.0.1:8384/";
        }
      ];
    };
  };
}
