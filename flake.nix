{

	description = "Kirkham NixOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    zen-browser.url = "github:MarceColl/zen-browser-flake";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

	outputs = { self, nixpkgs, home-manager, zen-browser, ... }@inputs: {
    nixosConfigurations.gnome = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [ 
      ./gnome/configuration.nix 
      ./modules/common.nix
      home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.backupFileExtension = "HMBackup";
          home-manager.useUserPackages = true;
          home-manager.users.kirkham.imports = [
            ./modules/home.nix
          ];
          home-manager.extraSpecialArgs = { inherit inputs; system = "x86_64-linux";};
        }
      ];
    };
  };
}

