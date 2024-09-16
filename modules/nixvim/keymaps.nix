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
      action = "";
      key = "<leader>f";
      options.desc = "+Find";
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
      action = "<cmd>HopWord<CR>";
      key = "<leader>fw";
      options.desc = "Find word";
    }

    {
      action = "";
      key = "<leader>b";
      options.desc = "+Buffers";
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
      action = "";
      key = "<leader>w";
      options.desc = "+Window";
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
      action = "";
      key = "<leader>t";
      options.desc = "+Tabs";
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

    {
      action = "";
      key = "<leader>d";
      options.desc = "+Dap";
    }
    {
      action = "<cmd>lua require('dapui').toggle()<CR>";
      key = "<leader>du";
      options.desc = "Dap UI";
    }
    {
      action = "<cmd>DapContinue<CR>";
      key = "<leader>dc";
      options.desc = "Continue";
    }
    {
      action = "<cmd>DapStepOver<CR>";
      key = "<leader>dn";
      options.desc = "Step Over";
    }
    {
      action = "<cmd>DapStepInto<CR>";
      key = "<leader>di";
      options.desc = "Step Into";
    }
    {
      action = "<cmd>DapStepOut<CR>";
      key = "<leader>do";
      options.desc = "Step Out";
    }
    {
      action = "<cmd>DapToggleBreakpoint<CR>";
      key = "<leader>db";
      options.desc = "Toggle Breakpoint";
    }

    {
      action = "";
      key = "<leader>h";
      options.desc = "+Harpoon";
    }
    {
      action = "<cmd>lua require('harpoon.mark').add_file()<CR>";
      key = "<leader>ha";
      options.desc = "Add file to harpoon";
    }
    {
      action = "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>";
      key = "<leader>hm";
      options.desc = "Show menu";
    }

    {
      key = "f";
      action.__raw = ''
        function()
          require'hop'.hint_char1({
            direction = require'hop.hint'.HintDirection.AFTER_CURSOR,
            current_line_only = true
          })
        end
      '';
      options.remap = true;
    }
    {
      key = "F";
      action.__raw = ''
        function()
          require'hop'.hint_char1({
            direction = require'hop.hint'.HintDirection.BEFORE_CURSOR,
            current_line_only = true
          })
        end
      '';
      options.remap = true;
    }
    {
      key = "t";
      action.__raw = ''
        function()
          require'hop'.hint_char1({
            direction = require'hop.hint'.HintDirection.AFTER_CURSOR,
            current_line_only = true,
            hint_offset = -1
          })
        end
      '';
      options.remap = true;
    }
    {
      key = "T";
      action.__raw = ''
        function()
          require'hop'.hint_char1({
            direction = require'hop.hint'.HintDirection.BEFORE_CURSOR,
            current_line_only = true,
            hint_offset = 1
          })
        end
      '';
      options.remap = true;
    }
  ];
}
