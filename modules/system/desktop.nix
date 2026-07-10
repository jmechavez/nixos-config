{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  services.desktopManager.plasma6.enable = false;

  programs.hyprland = {
    enable = true;
    withUWSM = true; # Recommended for better session management
  };

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
}
