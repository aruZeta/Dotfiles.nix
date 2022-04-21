{ config
, pkgs
, lib
, ...
}:

let enabledStuff = (import ./enable.nix);
in {
  home = {
    username = "aru";
    homeDirectory = "/home/${config.home.username}";
  };

  home.packages =
    (import ./packages.nix {inherit config pkgs lib enabledStuff;})
    ++ (import ./scripts.nix {inherit config pkgs lib enabledStuff;});

  nixpkgs.overlays = (import ./overlays.nix {inherit config pkgs lib enabledStuff;});

  programs = (import ./programs {inherit config pkgs lib enabledStuff;});

  # Enable stuff
  imports = [
    { programs = enabledStuff.programs; }
    enabledStuff.others
  ];
}
// (import ./others {inherit config pkgs lib enabledStuff;})
