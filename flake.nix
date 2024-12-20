{
	description = "Kirkham NixOS";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
		stylix.url = "github:danth/stylix";
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		
		zen-browser = {
			url = "github:MarceColl/zen-browser-flake";
		};
	};

	outputs = { self, nixpkgs, stylix, home-manager, zen-browser, ... }@inputs: 
		let
			system = "x86_64-linux";
			host = "hyprland";
			username = "kirkham";
		in
			{
				nixosConfigurations = {
					"${host}" = nixpkgs.lib.nixosSystem {
						specialArgs = { 
							inherit inputs username host system;
						};
						modules = [ 
							./system/${host}/configuration.nix 
							stylix.nixosModules.stylix
							home-manager.nixosModules.home-manager {
								home-manager = {
									useGlobalPkgs = true;
									useUserPackages = true;
									backupFileExtension = "HMBackup";
									users.${username}.imports = [
										./user/home.nix 
										./user/hyprland.nix 
									];
									extraSpecialArgs = { 
										inherit inputs host system username;
									};
								};
							}
						];
					};
				};
			};
}

