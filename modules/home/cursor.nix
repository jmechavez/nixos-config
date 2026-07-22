# Cursor theme configuration for both GTK apps and X11/XWayland apps.
{ pkgs, ... }:

{
  # 1. Install the package
  home.packages = [ pkgs.bibata-cursors ];

  # 2. Configure the pointer cursor
  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  # 3. Explicitly set environment variables for Hyprland
  # (native-Wayland apps don't always pick up home.pointerCursor automatically)
  wayland.windowManager.hyprland.settings = {
    env = [
      "XCURSOR_THEME,Bibata-Modern-Classic"
      "XCURSOR_SIZE,24"
    ];
  };
}

