{ config
, lib
, pkgs
, nur
, ...
} @ inputs:

let
  enabledStuff = (import ./enable.nix);
  nurPkgs = import nur { pkgs = pkgs; nurpkgs = pkgs; };
  argSet = inputs // {
    inherit enabledStuff;
    inherit nurPkgs;
  };
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
    sass
    unzip

    # Ebook reader & editor
    sigil
    calibre

    # QMK
    qmk

    # Discord
    discord

    # Gaming
    heroic
    legendary-gl
    wineWowPackages.waylandFull
    winetricks
    samba
    gamemode

    # Programming
    man-pages

    # Challenges
    exercism

    # IDEs
    jetbrains.idea-community
    jetbrains.idea-ultimate
    jetbrains.webstorm
    jetbrains.goland
    jetbrains.datagrip

    # Editing
    gimp
    inkscape

    # Containers
    docker-compose

    # Utils
    postman

    # Music
    nurPkgs.repos.milahu.spotify-adblock

    # Files
    xfce.thunar

    # Note taking and organization
    obsidian
  ]
  ++ (searchImportList "packages.nix" argSet')
  ++ (attrValues (searchImportSet "scripts.nix" argSet'));

  home.sessionVariables = {
    # NIX_LD = lib.fileContents "${pkgs.stdenv.cc}/nix-support/dynamic-linker";
  } // searchImportSet "session-vars.nix" argSet';
  home.file = searchImportSet "home-symlinks.nix" argSet';

  nixpkgs.overlays = searchImportList "overlays.nix" argSet';

  systemd.user.services = searchImportSet "services.nix" argSet';

  # Only allow the unfreePackages listed in enable.nix
  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) enabledStuff.unfreePackages;

  # Only allow the insecurePackages listed in enable.nix
  nixpkgs.config.permittedInsecurePackages = enabledStuff.insecurePackages;

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
