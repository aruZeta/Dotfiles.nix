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
  ]
  ++ (searchImportList "packages.nix" argSet')
  ++ (attrValues (searchImportSet "scripts.nix" argSet'));

  home.sessionVariables = searchImportSet "session-vars.nix" argSet';

  nixpkgs.overlays = searchImportList "overlays.nix" argSet';

  programs = dirToImportSet ./programs argSet';

  # Enable stuff
  imports = [
    { programs = enabledStuff.programs; }
    enabledStuff.others
  ];
} // (dirToImportSet ./others argSet')
