{pkgs, ...}:

{
  users.defaultUserShell = pkgs.zsh;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    shellInit = ''fastfetch'';

    ohMyZsh = {
      enable = true;
      theme = "gnzh";
      plugins = ["git" "history" "zoxide" "thefuck"];
    };
  };
}
