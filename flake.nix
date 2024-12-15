{

	description = "Kirkham NixOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
	
	outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.gnome = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [ 
      ./gnome/configuration.nix 
      ./modules/common.nix
      ];
    };
  };
}

