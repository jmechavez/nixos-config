{ pkgs, ... }:

{
  users.users."jmech_nix" = {
    isNormalUser = true;
    description = "jmech_nix";

    # Sudo, networking, Docker, printing
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "lp"
    ];

    packages = with pkgs; [
      kdePackages.kate
    ];
  };
}
