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
  wayland.windowManager.hyprland.settings = {
    env = [
      "XCURSOR_THEME,Bibata-Modern-Classic"
      "XCURSOR_SIZE,24"
    ];
  };
}
