{ pkgs
, config
, lib
, ...
}:

let enabledStuff = (import ./enable.nix {});
in
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

  programs = enabledStuff.programs;

  imports = [
    ./programs
    ./others
  ];
}
// enabledStuff.others
