{ pkgs
, config
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
    (import ./packages.nix pkgs config enabledStuff)
    ++ (import ./scripts.nix pkgs config lib enabledStuff);

  nixpkgs.overlays = (import ./overlays.nix enabledStuff);

  programs = (import ./programs pkgs config lib enabledStuff);

  # Enable stuff
  imports = [
    { programs = enabledStuff.programs; }
    enabledStuff.others
  ];
}
// (import ./others config pkgs enabledStuff)
