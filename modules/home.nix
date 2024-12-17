{ config, pkgs, inputs, system, ... }:

{
  # User Configuration
  home.username = "kirkham";
  home.homeDirectory = "/home/kirkham";

  # Program Configurations
  programs = {
    # Enable Home Manager
    home-manager.enable = true;

    # Enable Firefox
    firefox.enable = true;
    
    # Configure Git
    git = {
      enable = true;
      userName = "Jason Kirkham";
      userEmail = "jason.kirkham@gmail.com";
      extraConfig = {
        init = {
          defaultBranch = "main";
        };
      };
    };
  };

  # Install additional programs
  home.packages = with pkgs; [
    # Terminal Emulators
    alacritty  # A fast, cross-platform, OpenGL terminal emulator
    kitty      # Fast, feature-rich, GPU-based terminal emulator

    # Development Tools
    code-cursor # Cursor AI IDE (VSCode-based)
    git        # Distributed version control system
    vscodium   # Open source build of VSCode without Microsoft branding

    # System Information & Monitoring
    fastfetch  # Fast system information tool
    htop       # Interactive process viewer and system monitor
    pfetch     # Simple system information tool

    # File Management & Utilities
    bat        # A cat clone with syntax highlighting and Git integration
    duf        # Disk usage utility with a modern, intuitive interface
    eza        # Modern, maintained replacement for ls
    gparted    # Graphical disk partition editor
    tree       # Recursive directory listing command
    unrar      # Utility for extracting RAR archives
    unzip      # Utility for extracting ZIP archives

    # Nix Tools
    nh         # Nix helper for common commands

    # Media & Entertainment
    spotify    # Music streaming service
  ];

  # Home Manager State Version
  home.stateVersion = "24.11";
}