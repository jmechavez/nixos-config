# System user account definition.
{ ... }:

{
  users.users."jmech_nix" = {
    isNormalUser = true;
    description = "jmech_nix";

    extraGroups = [
      "networkmanager" # manage network connections without sudo
      "wheel"          # sudo access
      "docker"         # run docker without sudo
      "lp"             # printing access
    ];

    # NOTE: no `packages` list here anymore — user-facing GUI apps (like
    # kate, previously listed here) belong in home-manager scope instead;
    # see modules/home/apps.nix. This file should stay account/groups only.
  };
}

