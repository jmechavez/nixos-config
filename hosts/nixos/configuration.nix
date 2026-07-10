{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    ./services.nix
    ../../modules/system/desktop.nix
    ../../modules/system/audio.nix
    ../../modules/system/users.nix
  ];

  # Bootloader configuration
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;

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

  # Security and sudo configuration
  security.sudo.wheelNeedsPassword = true;
  security.sudo.extraConfig = ''
    Defaults timestamp_timeout=30
  '';

  # Hardware services
  services.printing.enable = true;

  # Remote access
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false; # key-based login only, more secure
      PermitRootLogin = "no";
    };
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
  nix.settings.trusted-users = [ "root" "jmech_nix" ];

  # System release version tracking
  system.stateVersion = "26.05";
}
