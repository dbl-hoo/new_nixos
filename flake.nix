{

	description = "Kirkham NixOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
	
	outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.gnome = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [ 
      ./gnome/configuration.nix 
      ./modules/common.nix
      home-manager.nixosModules.home-manager
        {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.kirkham = import ./modules/home.nix;
              extraSpecialArgs = {inherit inputs;}
            };
          };
      ];
    };
  };
}

