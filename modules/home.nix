{ config, pkgs, inputs, system, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "kirkham";
  home.homeDirectory = "/home/kirkham";



  #enable firefox
  programs.firefox.enable = true;
  
  # Install & Configure Git
     programs.git = {
       enable = true;
       userName = "Jason Kirkham";
       userEmail = "jason.kirkham@gmail.com";
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

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #

  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}