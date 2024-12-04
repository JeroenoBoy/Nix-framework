{...}:

{
  programs.kitty = {
    enable = true;
    extraConfig = ''
      background_opacity 0.5
      background_blur 64
      font_size 10.0
      map ctrl+shift+equal change_font_size all +0.5
      map ctrl+shift+plus change_font_size all +0.5
      map ctrl+equal change_font_size current +0.5
      map ctrl+plus change_font_size current +0.5
    '';
    settings = {
      enable_audio_bell = false;
    };
  };
}
