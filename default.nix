{ pkgs ? import <nixpkgs> { config = { allowUnfree = true; }; }
}:

let
  home-manager = builtins.fetchTarball {
    name = "home-manager-22.05";
    url = "https://github.com/nix-community/home-manager/archive/release-22.05.tar.gz";
    sha256 = "sha256:1sswsll6ia2j4ixzgqa39fwhv3vwrxshqxb544jmld4z8ylq9vx4";
  };

  evalHome = import "${toString home-manager}/modules";
in {
  system = pkgs.lib.recurseIntoAttrs (
    pkgs.nixos [ ./system ]
  );

  home = pkgs.lib.recurseIntoAttrs (
    evalHome {
      configuration = ./home;
      lib = pkgs.lib;
      pkgs = pkgs;
    }
  );
}
