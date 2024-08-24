{pkgs, ...}:

let
  graphite = pkgs.graphite-gtk-theme.override {
    tweaks = [ "nord" "darker" ];
  };
in
{
  gtk = {
    enable = true;
    theme = {
      name = "Graphite-Dark-nord";
      package = graphite;
      #name="Materia-dark";
      #package=pkgs.materia-theme;
    };
  };
}
