{pkgs, ...}:

{
  programs.nixvim.plugins = {
    dap-virtual-text.enable = true;
    dap-ui.enable = true;
    dap-python.enable = true;
    dap-go.enable = true;
    dap = {
      enable = true;

      signs = {
        dapBreakpoint = {
          text = "";
          texthl = "DapBreakpoint";
        };
        dapBreakpointCondition = {
          text = "";
          texthl = "dapBreakpointCondition";
        };
        dapBreakpointRejected = {
          text = "";
          texthl = "DapBreakpointRejected";
        };
        dapLogPoint = {
          text = "";
          texthl = "DapLogPoint";
        };
        dapStopped = {
          text = "";
          texthl = "DapStopped";
        };
      };

      adapters.executables."elixir_ls" = {
        command = "${pkgs.elixir-ls}/debug_adapter.sh";
      };

      configurations = {
        java = [{
          type = "java";
          request = "launch";
          name = "Debug (Attach) - Remote";
          hostName = "127.0.0.1";
          port = 5005;
        }];

        elixir = [{
          type = "elixir_ls";
          name = "Debug";
          taskArgs = [ "--trace" ];
          request = "launch";
          startApps = true;
        }];
      };

    };
  };
}
