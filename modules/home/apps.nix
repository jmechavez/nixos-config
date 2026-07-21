{ pkgs, inputs, ... }:
let
  system = pkgs.stdenv.hostPlatform.system;
in
{
  home.packages = with pkgs; [
    # Existing packages
    teams-for-linux
    inputs.zen-browser.packages.${system}.default
    foot

    # Added Thunar and its plugins
    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-volman
  ];

  # Set Thunar as the default file manager
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "inode/directory" = "thunar.desktop";
      "text/html" = "zen.desktop";
      "x-scheme-handler/http" = "zen.desktop";
      "x-scheme-handler/https" = "zen.desktop";
      "x-scheme-handler/about" = "zen.desktop";
      "x-scheme-handler/unknown" = "zen.desktop";
      "x-scheme-handler/terminal" = "foot.desktop";
    };
  };
}
