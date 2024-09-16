{pkgs, ...}:

{
  programs.nixvim.plugins = {
    dap = {
      enable = true;
      extensions = {
        dap-go.enable = true;
        dap-ui.enable = true;
        dap-python.enable = true;
        dap-virtual-text.enable = true;
      };

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

      configurations = {
        java = [{
          type = "java";
          request = "launch";
          name = "Debug (Attach) - Remote";
          hostName = "127.0.0.1";
          port = 5005;
        }];
      };

    };
  };
}
