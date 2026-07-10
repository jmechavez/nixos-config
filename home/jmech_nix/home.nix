{ pkgs, inputs, illogical-flake, ... }:

{
  imports = [
    illogical-flake.homeManagerModules.default
    ../../modules/home/yazi.nix
    ../../modules/home/cursor.nix
    ../../modules/home/dev-tools.nix
    ../../modules/home/apps.nix
    ../../modules/home/hypr-custom.nix
    ../../modules/home/git.nix
  ];

  programs.illogical-impulse.enable = true;

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
    options = [ "--cmd cd" ];
  };

  home.stateVersion = "24.05";
}
