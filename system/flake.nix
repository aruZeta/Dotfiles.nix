{
  inputs = {
    nixpkgs_23_05.url = "github:NixOS/nixpkgs/nixos-23.05";
    nixpkgs_unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager_23_05 = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs_23_05";
    };
  };

  outputs =
    { self
    , nixpkgs_23_05
    , nixpkgs_unstable
    , home-manager_23_05
    , ...
    } @ inputs:

    let
      noAllowDirty =
        if self ? rev
        then self.rev
        else throw "Refusing to build from a dirty Git tree!";
    in {
      nixosConfigurations = {
        "main-laptop.machine.aruZeta.com" = nixpkgs_23_05.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            # Hardware
            ./hardware/msi-bravo-15-b5dd.nix

            # Config
            ../users/aru/system/default.nix

            # Don't allow dirty git trees
            { system.configurationRevision = noAllowDirty; }

            # Home manager
            home-manager_23_05.nixosModules.home-manager

            # Home manager config
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.aru = import ../home/aru.nix;
            }
          ];
        };
      };
    };
}
