{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Americas/New_York";

  # Select internationalisation properties.
   i18n.defaultLocale = "en_US.UTF-8";

	#enable 	
  services.xserver = {
  	enable = true;
  	displayManager.gdm.enable = true;
  	desktopManager.gnome.enable = true;
		xkb.layout = "us";
	};

  # Enable sound.
  # services.pipewire = {
  #   enable = true;
  #   pulse.enable = true;
  # };

  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.users.kirkham = {
     isNormalUser = true;
     extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [
  #     tree
     ];
   };

 	#allow unfree
	nixpkgs.config.allowUnfree = true;

  # Your common configuration here
  environment.systemPackages = with pkgs; [
    git 
    neovim
		gedit	
		alacritty
		kitty
		code-cursor
    bat # A cat clone with syntax highlighting and Git integration
		duf # Disk usage utility with a modern, intuitive interface
    eza # Modern, maintained replacement for ls
    git # Distributed version control system
    gparted # Graphical disk partition editor
		htop # Interactive process viewer and system monitor
		nh # Nix helper
		spotify # Music streaming service
		tree # Recursive directory listing command
    unrar # Utility for extracting RAR archives
    unzip # Utility for extracting ZIP archives
    vscodium # code writing
  ];

	#disable firewall
   networking.firewall.enable = false;

	#flakes
	  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.05"; # Did you read the comment?

}

