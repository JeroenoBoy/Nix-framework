{...}:

{
  programs.nixvim.plugins = {
    lualine.enable = true;
    telescope.enable = true;
    telescope.extensions.file-browser.enable = true;
    auto-save.enable = true;
    nix.enable = true;
    yanky.enable = true;
    vim-css-color.enable = true;
    emmet.enable = true;
    spectre.enable = true;
    comment.enable = true;
    commentary.enable = true;
    todo-comments.enable = true;
    which-key.enable = true;
    web-devicons.enable = true;
    godot.enable = true;

    treesitter = {
      enable = true;
      folding = false;
      settings = {
        highlight = {
          additional_vim_regex_highlighting = true;
          enable = true;
        };

        indent.enable = true;
      };
    };

    harpoon = {
      enable = true;
      enableTelescope = true;
    };

    undotree = {
      enable = true;
      settings = {
        WindowLayout = 3;
      };
    };

    neo-tree = {
      enable = true;
      settings = {
        close_if_last_window = true;
        enable_diagnostics = false;
        enable_modified_markers = true;
        enable_git_status = true;
        popup_border_style = "rounded";
        window.position = "float";
      };
    };

    hop = {
      enable = true;
      settings = {
        case_insensitive = false;
      };
    };

    wilder = {
      enable = true;
      modes = [ "/" "?" ":" ];
    };
  };
}
