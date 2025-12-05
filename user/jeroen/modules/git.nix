{ ... }:

{
  programs.git = {
    enable = true;
    lfs.enable = true;
    settings.user = {
      name = "Jeroen van de Geest";
      email = "Jeroen@vandegeest.eu";
    };
  };
}
