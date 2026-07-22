# Desktop environment / window manager and display manager setup.
{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  services.desktopManager.plasma6.enable = false; # KDE Plasma explicitly off — Hyprland is the WM

  programs.hyprland = {
    enable = true;
    withUWSM = true; # Recommended for better session management
  };

  services.displayManager.sddm = {
    enable = true;

    # Skips the login screen and boots straight into jmech_nix's session.
    # Convenient on a personal single-user machine; reconsider if this
    # machine is ever shared or portable.
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

