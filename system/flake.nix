{
  inputs = {
    nixpkgs_23_05.url = "github:NixOS/nixpkgs/nixos-23.05";
    nixpkgs_unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { self
    , nixpkgs_23_05
    , nixpkgs_unstable
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
          ];
        };
      };
    };
}
