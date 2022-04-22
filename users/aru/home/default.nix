{ config
, pkgs
, lib
, ...
}:

let
  enabledStuff = (import ./enable.nix);
  argSet = {inherit config pkgs lib enabledStuff;};
  usefulExpresions = (import ./useful-expresions.nix argSet);
  argSet' = argSet // {inherit usefulExpresions;};
in {
  home = {
    username = "aru";
    homeDirectory = "/home/${config.home.username}";
  };

  home.packages =
    (import ./packages.nix argSet')
    ++ (import ./scripts.nix argSet');

  nixpkgs.overlays = (import ./overlays.nix argSet');

  programs = (import ./programs argSet');

  # Enable stuff
  imports = [
    { programs = enabledStuff.programs; }
    enabledStuff.others
  ];
}
// (import ./others argSet')
