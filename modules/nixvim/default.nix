{nixvim, system, ...}:

{
  imports = [
    ./cmp.nix
    ./dap.nix
    ./keymaps.nix
    ./lsp.nix
    ./plugins.nix
  ];

  programs.nixvim = {
      enable = true;
      colorschemes.onedark.enable = true;

      clipboard = {
        register = "unnamedplus";
        providers.wl-copy.enable = true;
      };

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

      filetype.extension = {
        "templ" = "templ";
      };

      extraConfigLua = ''
        local dap = require("dap")
        local dapui = require("dapui")

        -- Automatically open the DAP UI when the debugging session begins
        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end
      '';
  };
}
