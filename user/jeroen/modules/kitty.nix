{...}:

{
  programs.kitty = {
    enable = true;
    extraConfig = ''
      background_opacity 0.5
      background_blur 64
      font_size 10.0
    '';
    settings = {
      enable_audio_bell = false;
    };
  };
}
