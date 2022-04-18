{ pkgs
, config
, lib
, ...
}:

{
  home = {
    username = "aru";
    homeDirectory = "/home/${config.home.username}";
  };

  home.packages =
    (import ./packages.nix {inherit pkgs config;})
    ++ (import ./scripts.nix {inherit pkgs config lib;});

  xdg.configFile = (import ./xdg-symlinks.nix {inherit config;});

  nixpkgs.overlays = (import ./overlays.nix {});

  imports = [
    ./programs
  ];
}
