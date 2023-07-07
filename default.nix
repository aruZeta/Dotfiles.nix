{ pkgs ? import <nixpkgs> { config = { allowUnfree = true; }; }
}:

let
  home-manager = builtins.fetchTarball {
    name = "home-manager-unstable";
    url = "https://github.com/nix-community/home-manager/archive/release-23.05.tar.gz";
    sha256 = "sha256:08zc9fqniv0r8cgrw4n2gbdpr8bh0q2vf9i2pcmkrxdd2rnm8zms";
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

