{ pkgs ? import <nixpkgs> { config = { allowUnfree = true; }; }
}:

let
  home-manager = builtins.fetchTarball {
    name = "home-manager-22.05";
    url = "https://github.com/nix-community/home-manager/archive/release-22.05.tar.gz";
    sha256 = "1bn5m4qlzxc5c264hwyy9n8f7m1pzc79fd0xh18n46wn0v8vx4jn";
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
