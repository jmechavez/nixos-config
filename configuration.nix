{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./packages.nix   # Imports your dev toolchain file
    ./services.nix   # Imports your background engines file
  ];

  # Bootloader configuration
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # Regional and locale settings
  time.timeZone = "Asia/Manila";

  i18n.defaultLocale = "en_PH.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS        = "fil_PH";
    LC_IDENTIFICATION = "fil_PH";
    LC_MEASUREMENT    = "fil_PH";
    LC_MONETARY       = "fil_PH";
    LC_NAME           = "fil_PH";
    LC_NUMERIC        = "fil_PH";
    LC_PAPER          = "fil_PH";
    LC_TELEPHONE      = "fil_PH";
    LC_TIME           = "fil_PH";
  };

  # Graphical desktop session
  services.xserver.enable = true;
  services.desktopManager.plasma6.enable = false;

  programs.hyprland = {
    enable = true;
    withUWSM = true; # Recommended for better session management
  };

  # Display manager (auto-login)
  services.displayManager.sddm = {
    enable = true;

    autoLogin = {
      enable = true;
      user = "jmech_nix";
    };
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Security and sudo configuration
  security.sudo.wheelNeedsPassword = true;

  security.sudo.extraConfig = ''
    Defaults timestamp_timeout=30
  '';

  # Hardware services
  services.printing.enable = true;

  services.pulseaudio.enable = false;

  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Primary user profile
  users.users."jmech_nix" = {
    isNormalUser = true;
    description = "jmech_nix";

    # Sudo, networking, Docker, printing
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "lp"
    ];

    packages = with pkgs; [
      kdePackages.kate
    ];
  };

  # Applications
  programs.firefox.enable = true;

  # GPG and Pinentry
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryPackage = pkgs.pinentry-curses;
  };

  # Nix configuration
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # System release version tracking
  system.stateVersion = "26.05";
}
