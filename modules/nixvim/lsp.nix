{...}:

let
  enableHtmlWithTempl = {
    enable = true;
    filetypes = ["html" "templ"];
  };
in
{
  programs.nixvim.plugins = {
    lsp-format.enable = true;
    lsp = {
      enable = true;
      servers = {

        # Build tools
        nil-ls.enable = true;
        cmake.enable = true;
        ccls.enable = true;

        # Config
        jsonls.enable = true;
        yamlls.enable = true;
        ltex.enable = true;
        sqls.enable = true;

        # Web
        html = enableHtmlWithTempl;
        emmet-ls.enable = true;
        htmx = enableHtmlWithTempl;
        cssls.enable = true;
        svelte.enable = true;
        tsserver.enable = true;
        templ = {
          enable = true;
          autostart = true;
          filetypes = ["templ"];
        };
        tailwindcss = {
          enable = true;
          filetypes = ["html" "css" "templ" "javascript" "typescript" "react"];
        };

        # Backend
        kotlin-language-server.enable = true;
        java-language-server.enable = true;
        gopls.enable = true;
        pylsp.enable = true;
      };
      
      keymaps = {
        lspBuf = {
          gd = {
            action = "definition";
            desc = "Goto Definition";
          };
          gr = {
            action = "references";
            desc = "Goto References";
          };
          gD = {
            action = "declaration";
            desc = "Goto Declaration";
          };
          gI = {
            action = "implementation";
            desc = "Goto Implementation";
          };
          gT = {
            action = "type_definition";
            desc = "Type Definition";
          };
          K = {
            action = "hover";
            desc = "Hover";
          };
          "<C-.>" = {
            action = "hover";
            desc = "Hover";
          };
          "<leader>cw" = {
            action = "workspace_symbol";
            desc = "Workspace Symbol";
          };
          "<leader>cr" = {
            action = "rename";
            desc = "Rename";
          };
        };
        diagnostic = {
          "<leader>cd" = {
            action = "open_float";
            desc = "Line Diagnostics";
          };
          "[d" = {
            action = "goto_next";
            desc = "Next Diagnostic";
          };
          "]d" = {
            action = "goto_prev";
            desc = "Previous Diagnostic";
          };
        };
      };
    };
  };
}
