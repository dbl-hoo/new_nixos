{ config, pkgs, inputs, system, lib, ... }:

{
  #imports
  imports = [./shell.nix];
  
  # User Configuration
  home.username = "kirkham";
  home.homeDirectory = "/home/kirkham";

  # Stylix  Options
  gtk = {
    enable = true;
    iconTheme = {
      name = "Qogir";
      package = pkgs.qogir-icon-theme;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };
  qt = {
    enable = true;
    style.name = "adwaita-dark";
    platformTheme.name = "gtk3";
  };


  # Program Configurations
  programs = {
    # Enable Home Manager
    home-manager.enable = true;

    # Enable Firefox
    firefox.enable = true;

    alacritty.enable = true;

    waybar.enable = true;

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

    # Browsers
    inputs.zen-browser.packages.${system}.specific  # Zen Browser

    # System Information & Monitoring
    fastfetch  # Fast system information tool
    htop       # Interactive process viewer and system monitor
    pfetch     # Simple system information tool
    ncdu       # Ncurses disk usage analyzer

    # File Management & Utilities
    bat        # A cat clone with syntax highlighting and Git integration
    brightnessctl # Simple program to read and control device brightness
    dosfstools # Tools for creating and checking MS-DOS FAT filesystems
    duf        # Disk usage utility with a modern, intuitive interface
    eza        # Modern, maintained replacement for ls
    file-roller # Archive manager for GNOME
    font-manager # Font management application for GTK desktop environments
    gparted    # Graphical disk partition editor
    killall    # Utility to kill processes by name
    tree       # Recursive directory listing command
    unrar      # Utility for extracting RAR archives
    unzip      # Utility for extracting ZIP archives
    wget       # Command-line file retriever

    # Nix Tools
    nh         # Nix helper for common commands

    # Media & Entertainment
    spotify    # Music streaming service
    ffmpeg     # Complete solution for recording, converting, and streaming audio/video
    mpv        # Media player
    playerctl  # Command-line utility for controlling media players

    # System Management
    hplip      # HP printing support
    ntfs3g     # NTFS filesystem driver and utilities
    greetd.tuigreet # Text-based greeter for login managers

    # Wayland Specific
    hyprpolkitagent # Polkit authentication agent for Hyprland
    wl-clipboard # Command-line copy/paste utility for Wayland
    waybar      # Status bar for Wayland
		rofi-wayland

    # Network & System Tray
    networkmanagerapplet      # A graphical front-end for iwd and an indicator
    pavucontrol # PulseAudio volume control

    # Notification & Display
    libnotify  # Library for sending desktop notifications

    # Text Editors
    gedit      # GNOME text editor
  ];

  # Home Manager State Version
  home.stateVersion = "24.11";
}
