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

  nixpkgs.overlays = (import ./overlays.nix {});

  programs = (import ./programs {inherit pkgs config lib;});

  # Enable stuff
  imports =
    let enabledStuff = (import ./enable.nix {});
    in [
      { programs = enabledStuff.programs; }
      enabledStuff.others
    ];
}
// (import ./others {inherit config;})
