{ pkgs, lib, ... }:

let
  extra-path = with pkgs; [
    jdk21
  ];

  extra-lib = with pkgs; [
    # Add any extra libraries you want accessible to Rider here
  ];

  idea = pkgs.jetbrains.idea.overrideAttrs (attrs: {
    postInstall = ''
      # Wrap rider with extra tools and libraries
      mv $out/bin/idea $out/bin/.idea-toolless
      makeWrapper $out/bin/.idea-toolless $out/bin/idea \
        --argv0 rider \
        --prefix PATH : "${lib.makeBinPath extra-path}" \
        --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath extra-lib}"

      # Making Unity Rider plugin work!
      # The plugin expects the binary to be at /rider/bin/idea,
      # with bundled files at /idea/
      # It does this by going up two directories from the binary path
      # Our rider binary is at $out/bin/idea, so we need to link $out/idea/ to $out/
      shopt -s extglob
      ln -s $out/idea/!(bin) $out/
      shopt -u extglob
    ''
    + attrs.postInstall or "";
  });
in
{
  environment.systemPackages = [
    idea
  ];
}
