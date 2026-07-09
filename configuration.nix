{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./packages.nix   # Imports your dev toolchain file
    ./services.nix   # Imports your background engines file
  ];

  # Bootloader configurations
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # Regional and Locale Settings
  time.timeZone = "Asia/Manila";
  i18n.defaultLocale = "en_PH.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fil_PH";
    LC_IDENTIFICATION = "fil_PH";
    LC_MEASUREMENT = "fil_PH";
    LC_MONETARY = "fil_PH";
    LC_NAME = "fil_PH";
    LC_NUMERIC = "fil_PH";
    LC_PAPER = "fil_PH";
    LC_TELEPHONE = "fil_PH";
    LC_TIME = "fil_PH";
  };

  # Graphical Desktop Session (KDE Plasma 6 with Auto-Login)
  services.xserver.enable = true;
  services.desktopManager.plasma6.enable = false;

  programs.hyprland = {
    enable = true;
    withUWSM = true; # Recommended for better session management
  };
  
  # Configure Auto-Login to bypass the login screen
  services.displayManager.sddm = {
    enable = true;
    autoLogin = {
      enable = true;
      user = "jmech_nix";
    };
  };
  
  services.xserver.xkb = { layout = "us"; variant = ""; };

  # Security and Sudo configuration (extends password timeout for smoother editing)
  security.sudo.wheelNeedsPassword = true;
  security.sudo.extraConfig = ''
    Defaults timestamp_timeout=30
  '';

  # Hardware Enablement Services
  services.printing.enable = true;
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Primary User Profile Configuration
  users.users."jmech_nix" = {
    isNormalUser = true;
    description = "jmech_nix";
    # Assigned to wheel (sudo), networkmanager, and docker groups
    extraGroups = [ "networkmanager" "wheel" "docker" "lp"];
    packages = with pkgs; [ kdePackages.kate ];
  };

  programs.firefox.enable = true;
  nixpkgs.config.allowUnfree = true;

  # Permanently register Experimental Flake Utilities
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # System Release Version Tracking
  system.stateVersion = "26.05";
}
