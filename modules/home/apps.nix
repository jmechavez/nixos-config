# User-level application packages (home-manager scope).
#
# FIXED: this file used to be a byte-for-byte copy of
# hosts/nixos/services.nix (docker, postgresql, bluetooth, geoclue2, nix.gc).
# Those are NixOS *system* options, but this file is imported from
# home/jmech_nix/home.nix as a *home-manager* module — home-manager has no
# `virtualisation.docker.enable`, `services.postgresql`, `hardware.bluetooth`,
# `services.blueman`, or `nix.gc` options, so this would fail to evaluate/build.
# That system-level config already lives correctly in hosts/nixos/services.nix,
# so it's simply removed from here.
#
# Also added:
#  - zen-browser, since hypr-custom.nix sets `browser = "zen"` as the
#    default browser but the package was never actually installed anywhere.
#  - kate, moved here from modules/system/users.nix. It's a user-facing GUI
#    app, so it belongs in home-manager scope rather than the system-level
#    user-account module.
{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    inputs.zen-browser.packages.${pkgs.system}.default
    kdePackages.kate
  ];
}

