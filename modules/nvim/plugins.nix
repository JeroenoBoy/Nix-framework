{...}:

{
  programs.nixvim.plugins = {
    lualine.enable = true;
    telescope.enable = true;
    telescope.extensions.file-browser.enable = true;
    which-key.enable = true;
    auto-save.enable = true;
    nix.enable = true;
    yanky.enable = true;
    vim-css-color.enable = true;
    emmet.enable = true;

    treesitter = {
      enable = true;
      folding = false;
    };

    undotree = {
      enable = true;
      settings = {
        WindowLayout = 3;
      };
    };

    neo-tree = {
      enable = true;
      enableModifiedMarkers = true;
      enableGitStatus = true;
      closeIfLastWindow = true;
      popupBorderStyle = "rounded";
      window.position = "float";
    };
  };
}
