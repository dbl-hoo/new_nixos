{ config, pkgs, ... }:

{
  
#enable firefox
  programs.firefox.enable = true;
  
  # Your common configuration here
  environment.systemPackages = with pkgs; [
    git 
    neovim
		gedit	
		alacritty
		kitty
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

}

