{ pkgs ? import <nixpkgs> { config = { allowUnfree = true; }; }
}:

let
  home-manager = builtins.fetchTarball {
    name = "home-manager-unstable";
    url = "https://github.com/nix-community/home-manager/archive/da72e6fc6b7dc0c3f94edbd310aae7cd95c678b5.tar.gz";
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
