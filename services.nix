{ pkgs, ... }:

{
  # Docker Containerization Host Engine
  virtualisation.docker.enable = true;

  # PostgreSQL Local Database Host
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_16;
    # ... keep your database configurations exactly as they were
  };

  # Automatic Garbage Collection and Store Optimisation
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
  nix.settings.auto-optimise-store = true;

  # ============================================================
  # HYPRLAND & DESKTOP SERVICES
  # ============================================================
  programs.hyprland.enable = true;

  services.geoclue2.enable = true;      # Handles location API scopes for Qt widgets
  networking.networkmanager.enable = true;  # Robust background network manager tracking

  # Enable Bluetooth hardware support
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true; # Automatically turns on bluetooth adapter on boot
  };

  # Enable the Bluetooth manager service (essential for tray icons/bars)
  services.blueman.enable = true;

}
