# Top-level home-manager config for user jmech_nix.
# Everything under modules/home/*.nix is imported here.
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
    ../../modules/home/btop.nix
  ];

  
  programs.illogical-impulse = {
    enable = true;

    # Customize shell tools (all enabled by default)
    dotfiles = {
      fish.enable = true;     # Fish shell with custom config
      kitty.enable = true;    # Kitty terminal emulator
      starship.enable = true; # Starship prompt
    };
  };



  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
    options = [ "--cmd cd" ]; # lets `cd` itself invoke zoxide's smart jumping
  };

  # Home Manager release compatibility version — this tracks the HM release
  # your config was first written against, NOT your NixOS version below.
  # It's fine (and expected) for this to differ from system.stateVersion
  # in configuration.nix; just don't bump either casually.
  home.stateVersion = "24.05";
}

