{ pkgs ? import <nixpkgs> { config = { allowUnfree = true; }; }
}:

let
  home-manager = builtins.fetchTarball {
    name = "home-manager-unstable";
    url = "https://github.com/nix-community/home-manager/archive/9f7fe353b613d0e45d7a5cdbd1f13c96c15803dd.tar.gz";
    sha256 = "sha256:0n8lg7dm6cdnr2111pbfg16lqy3slv9a0cg3dy8d1f8ry40ippwn";
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
