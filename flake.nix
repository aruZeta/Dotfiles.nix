{
  inputs = {
    nixpkgs_23_05.url = "github:NixOS/nixpkgs/nixos-23.05";
    nixpkgs_unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager_23_05 = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs_23_05";
    };
    emacs_23_07_09 = {
      url = "github:nix-community/emacs-overlay/2a779188014aad4cfc73860c97121d9707259e2a";
      inputs.nixpkgs.follows = "nixpkgs_23_05";
    };
    nur.url = "github:nix-community/NUR";
    flakez.url = "github:aruZeta/flakez";
  };

  outputs =
    { self
    , nixpkgs_23_05
    , nixpkgs_unstable
    , home-manager_23_05
    , nur
    , flakez
    , ...
    } @ inputs:

    let
      noAllowDirty =
        if self ? rev
        then self.rev
        else throw "Refusing to build from a dirty Git tree!";
      domain = "machine.aruzeta.com";
      hosts = {
        mainLaptop = {
          name = "main-laptop";
          system = "x86_64-linux";
        };
      };
      apply = host: modules:
        let
          conf = {
            system = host.system;
            modules = (modules host) ++ [
              # Set hostname and domain
              (networking host)

              # Don't allow dirty git trees
              { system.configurationRevision = noAllowDirty; }
            ];
          };
        in {
        ${host.name} = nixpkgs_23_05.lib.nixosSystem conf;
      };
      networking = host:
        { networking = {
            hostName = host.name;
            domain = domain;
          };
        };
    in {
      nixosConfigurations = {
      } // (apply hosts.mainLaptop (host: [
        # Hardware
        ./hardware/msi-bravo-15-b5dd.nix

        # Config
        ./users/aru/system/default.nix

        # Home manager
        home-manager_23_05.nixosModules.home-manager

        # Home manager config
        {
          home-manager.useGlobalPkgs = false;
          home-manager.useUserPackages = true;
          home-manager.users.aru = import ./home/aru.nix;
          home-manager.extraSpecialArgs = inputs // {
            pkgsUnstable = config: import nixpkgs_unstable {
              system = host.system;
              inherit config;
            };
          };
        }
      ]));
    };
}
