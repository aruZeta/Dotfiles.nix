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
    stateVersion = "23.05";
    username = "aru";
    homeDirectory = "/home/${config.home.username}";
  };

  home.packages = with pkgs; [
    # Utilities
    unzip

    # Browser
    google-chrome

    # Chat
    slack

    # Editors
    jetbrains.idea-community

    # Music
    spotify

    # containers
    docker-compose

    # Tools
    postman

    # Note taking and organization
    obsidian
  ]
  ++ (searchImportList "packages.nix" argSet')
  ++ (attrValues (searchImportSet "scripts.nix" argSet'));

  home.sessionVariables = {
    NIX_LD = lib.fileContents "${pkgs.stdenv.cc}/nix-support/dynamic-linker";
  } // searchImportSet "session-vars.nix" argSet';
  home.file = searchImportSet "home-symlinks.nix" argSet';

  nixpkgs.overlays = searchImportList "overlays.nix" argSet';

  systemd.user.services = searchImportSet "services.nix" argSet';

  # Only allow the unfreePackages listed in enable.nix
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) enabledStuff.unfreePackages;

  programs = dirToImportSet ./programs argSet';
  services = dirToImportSet ./services argSet';

  # Weird bug
  manual.manpages.enable = false;
  manual.html.enable = false;
  manual.json.enable = false;

  # Enable stuff
  imports = [
    { programs = enabledStuff.programs; }
    { services = enabledStuff.services; }
    enabledStuff.others
  ];
} // (dirToImportSet ./others argSet')
