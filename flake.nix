{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Zen Browser: used as the default browser (see modules/home/hypr-custom.nix
    # and modules/home/apps.nix, which now actually installs the package).
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    illogical-flake = {
      url = "github:soymou/illogical-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    kiru.url = "github:kiruhq/kiru-nix";
  };

  outputs = { self, nixpkgs, home-manager, illogical-flake, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      # Makes `inputs` (flake inputs) available to every NixOS module
      # via specialArgs, e.g. packages.nix uses inputs.kiru.
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/nixos/configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "hm-backup";

          # Makes `inputs` and `illogical-flake` available inside every
          # home-manager module (home.nix, apps.nix, etc).
          home-manager.extraSpecialArgs = { inherit inputs illogical-flake; };

          home-manager.users.jmech_nix = import ./home/jmech_nix/home.nix;
        }
      ];
    };
  };
}

