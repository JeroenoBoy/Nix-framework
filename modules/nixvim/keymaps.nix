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
        {
      action = "<cmd>buffers<CR>";
      key = "<leader>bl";
      options.desc = "Show the contents of the current buffer";
    }
    {
      action = "<cmd>b#<CR>";
      key = "<leader>br";
      options.desc = "Return to the previously selected buffer";
    }
    {
      action = "<cmd>vsplit<CR>";
      key = "<leader>ws";
      options.desc = "Horizontal split";
    }
    {
      action = "<cmd>split<CR>";
      key = "<leader>wv";
      options.desc = "Vertical split";
    }

    {
      action = "<cmd>tabnew<CR>";
      key = "<leader>tn";
      options.desc = "Create a new tab";
    }
    {
      action = "<cmd>tabn<CR>";
      key = "<leader>tl";
      options.desc = "Move to the next tab";
    }
    {
      action = "<cmd>tabp<CR>";
      key = "<leader>th";
      options.desc = "Move to the previous tab";
    }
    {
      action = "<cmd>tabc<CR>";
      key = "<leader>tc";
      options.desc = "Close the current tab";
    }
    {
      action = "<cmd>tabo<CR>";
      key = "<leader>ta";
      options.desc = "Close all tabs except for the current one";
    }
    {
      action = "<cmd>tabm +<CR>";
      key = "<leader>tL";
      options.desc = "Move the current tab page to the right";
    }
    {
      action = "<cmd>tabm -<CR>";
      key = "<leader>tH";
      options.desc = "Move the current tab to the left";
    }
  ];
}
