{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../fonts.nix
  ];

  # Boot Configuration
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  # System Configuration
  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Networking
  networking = {
    networkmanager.enable = true;
    firewall.enable = false;
  };

  # Desktop Environment
  programs = {
    hyprland.enable = true;
    zsh.enable = true;
  };

  # User Configuration
  users.defaultUserShell = pkgs.zsh;
  users.users.kirkham = {
    homeMode = "755";
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "scanner" "lp" ];
    packages = with pkgs; [];
  };

  stylix = {
    enable = true;
    image = ../../user/wallpapers/east_tn_mountains.jpg;
    polarity = "dark";
    opacity.terminal = 0.8;
    cursor.package = pkgs.bibata-cursors;
    cursor.name = "Bibata-Modern-Ice";
    cursor.size = 24;
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font Mono";
      };
      sansSerif = {
        package = pkgs.montserrat;
        name = "Montserrat";
      };
      serif = {
        package = pkgs.montserrat;
        name = "Montserrat";
      };
      sizes = {
        applications = 12;
        terminal = 14;
        desktop = 11;
        popups = 12;
      };
    };
  };

  # System Packages
  environment.systemPackages = with pkgs; [
    nano
    git
  ];

  system.stateVersion = "25.05";
}

