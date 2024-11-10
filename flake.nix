{
  description = "LaiOS: My nix config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOs/nixos-hardware/master";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rose-pine-hyprcursor.url = "github:ndom91/rose-pine-hyprcursor";
  };

  outputs = {
    self,
    nixpkgs,
    nixos-hardware,
    nix-flatpak,
    nixvim,
    home-manager,
    ...
  }@inputs: 
  let
    system = "x86_64-linux";
    version = "unstable";
    home-manager-version = "24.11";
  in {
    nixosConfigurations = {
      LaiOS = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {inherit system version nixvim;};
        modules = [
          nixos-hardware.nixosModules.framework-13-7040-amd
          nix-flatpak.nixosModules.nix-flatpak
          nixvim.nixosModules.nixvim
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.jeroen = import ./user/jeroen;
            home-manager.extraSpecialArgs = {
              inherit system;
              inherit inputs;
              version = home-manager-version;
            };
          }
          ./nixConfig.nix
        ];
      };
    };
  };
}
