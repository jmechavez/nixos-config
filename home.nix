{ pkgs, inputs, illogical-flake, ... }: 

{
  imports = [
    illogical-flake.homeManagerModules.default
    ./modules/yazi.nix
    ./modules/cursor.nix
    ./modules/dev-tools.nix
    ./modules/apps.nix
    ./modules/hypr-custom.nix
  ];

  programs.illogical-impulse.enable = true;

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
    options = [ "--cmd cd" ];
  };

  home.stateVersion = "24.05";
}
