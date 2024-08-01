{...}:

{
  programs.nixvim.globals.mapleader = " ";
  programs.nixvim.keymaps = [
    {
      action = "<cmd>Neotree<CR>";
      key = "<leader>e";
      options.desc = "Open Nerd Tree";
    }

    {
      action = "<cmd>UndotreeToggle<CR>";
      key = "<leader>u";
      options.desc = "Open Undo Tree";
    }

    {
      action = "<cmd>Telescope find_files<CR>";
      key = "<leader>ff";
      options.desc = "Find file";
    }
    {
      action = "<cmd>Telescope file_browser<CR>";
      key = "<leader>fb";
      options.desc = "File browser";
    }
  ];
}
