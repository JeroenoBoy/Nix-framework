{...}:

{
  programs.nixvim.plugins = {
    snacks = {
      enable = true;
      settings = {
        dashboard = {
          enable = true;
        };

        notifier = {
          enable = true;
        };
      };

      luaConfig.post = ''

      '';
    };
  };
}
