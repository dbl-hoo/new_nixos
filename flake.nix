{
	description = "Kirkham NixOS";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		
		zen-browser = {
			url = "github:MarceColl/zen-browser-flake";
		};
	};

	outputs = { self, nixpkgs, home-manager, zen-browser, ... }@inputs: {
		nixosConfigurations = {
			# GNOME Configuration
			gnome = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				specialArgs = { inherit inputs; };
				modules = [ 
					./system/gnome/configuration.nix 
					
					home-manager.nixosModules.home-manager {
						home-manager = {
							useGlobalPkgs = true;
							useUserPackages = true;
							backupFileExtension = "HMBackup";
							users.kirkham.imports = [ ./modules/home.nix ];
							extraSpecialArgs = { 
								inherit inputs; 
								system = "x86_64-linux";
							};
						};
					}
				];
			};
			
			# Hyprland Configuration
			hyprland = nixpkgs.lib.nixosSystem {
				system = "x86_64-linux";
				specialArgs = { inherit inputs; };
				modules = [ 
					./system/hyprland/configuration.nix 
					
					home-manager.nixosModules.home-manager {
						home-manager = {
							useGlobalPkgs = true;
							useUserPackages = true;
							backupFileExtension = "HMBackup";
							users.kirkham.imports = [ 
                ./modules/home.nix 
                ./user/hyprland/hyprland.nix 
              ];
							extraSpecialArgs = { 
								inherit inputs; 
								system = "x86_64-linux";
							};
						};
					}
				];
			};
		};
	};
}

