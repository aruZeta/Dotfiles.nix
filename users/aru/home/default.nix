{ config
, lib
, pkgs
, ...
}:

let
  enabledStuff = (import ./enable.nix);
  argSet = {inherit config pkgs lib enabledStuff;};
  usefulExpresions = (import ./useful-expresions.nix argSet);
  argSet' = argSet // {inherit usefulExpresions;};

  inherit (builtins)
    attrValues;
  inherit (usefulExpresions)
    dirToImportSet
    searchImportList
    searchImportSet;
in

{
  home = {
    username = "aru";
    homeDirectory = "/home/${config.home.username}";
  };

  home.packages = with pkgs; [
    # Utilities
    sass
    unzip

    # Ebook reader & editor
    sigil
    # calibre

    # QMK
    qmk

    # Music
    yt-dlp

    # Discord
    discord
  ]
  ++ (searchImportList "packages.nix" argSet')
  ++ (attrValues (searchImportSet "scripts.nix" argSet'));

  home.sessionVariables = searchImportSet "session-vars.nix" argSet';

  nixpkgs.overlays = searchImportList "overlays.nix" argSet';

  # Only allow the unfreePackages listed in enable.nix
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) enabledStuff.unfreePackages;

  programs = dirToImportSet ./programs argSet';
  services = dirToImportSet ./services argSet';

  # Enable stuff
  imports = [
    { programs = enabledStuff.programs; }
    { services = enabledStuff.services; }
    enabledStuff.others
  ];
} // (dirToImportSet ./others argSet')
