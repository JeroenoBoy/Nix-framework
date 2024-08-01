{...}:

{
  imports = [
    ./cmp.nix
    ./keymaps.nix
    ./lsp.nix
    ./plugins.nix
    ./startup.nix
  ];

  programs.nixvim = {
    enable = true;
    colorschemes.onedark.enable = true;

    globalOpts = {
      number = true;
      relativenumber= true;

      expandtab = true;
      smarttab = true;
      smartcase = true;
      
      tabstop = 4;
      shiftwidth = 4;
      softtabstop = 0;
    };

    clipboard.register = "unnamedplus";
  };
}
