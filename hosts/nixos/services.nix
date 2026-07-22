# System-level services. These are NixOS options (not home-manager options) —
# this is the correct place for docker/postgres/bluetooth/etc.
# NOTE: this content was previously duplicated into modules/home/apps.nix,
# which is imported as a *home-manager* module. That duplicate has been
# removed there — see the comment at the top of apps.nix.
{ pkgs, ... }:

{
  # Docker Containerization Host Engine
  virtualisation.docker.enable = true;
  virtualisation.docker.autoPrune.enable = true;

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

  services.geoclue2.enable = true;      # Handles location API scopes for Qt widgets

  # Enable Bluetooth hardware support
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true; # Automatically turns on bluetooth adapter on boot
  };

  # Enable the Bluetooth manager service (essential for tray icons/bars)
  services.blueman.enable = true;
}

