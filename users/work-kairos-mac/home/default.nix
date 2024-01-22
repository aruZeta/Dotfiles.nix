{ config
, pkgs
, lib
, nur
, user
, ...
} @ inputs:

let
  enabledStuff = (import ../enable.nix);
  nixpkgsConfig = {
    allowUnfreePredicate = pkg:
      builtins.elem (lib.getName pkg) enabledStuff.unfreePackages;
  };
  pkgsUnstable = inputs.pkgsUnstable nixpkgsConfig;
  nurPkgs = import nur { pkgs = pkgs; nurpkgs = pkgs; };
  extra = let
    inherit (config.home)
      homeDirectory;
    inherit (config.xdg.userDirs)
      documents;
  in {
    XDG_DOTFILES_DIR  = "${homeDirectory}/Dotfiles.nix";
    XDG_PUBLISH_DIR   = "${homeDirectory}/Publish";
    XDG_KEYS_DIR      = "${documents}/Keys";
    XDG_ORG_DIR       = "${documents}/Org";
    XDG_GIT_REPOS_DIR = "${homeDirectory}/GitRepos";
  };
  argSet = inputs // {
    inherit enabledStuff;
    inherit nurPkgs;
    inherit extra;
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
    username = user.name;
    homeDirectory = user.home;
  };

  home.packages = with pkgs; [
    pkgsUnstable.jetbrains.idea-ultimate
    pkgsUnstable.jetbrains.webstorm
    pkgsUnstable.jetbrains.goland

    # https://github.com/NixOS/nixpkgs/issues/267680
    # postman is a POS, if possible I will migrate all projects I'm working on to bruno
    # postman
    # bruno # still not avaibla for M1

    # nurPkgs.repos.milahu.spotify-adblock # need to find one for M1
    spotify

    # Note taking and organization
    obsidian
  ]
  ++ (searchImportList "packages.nix" argSet')
  ++ (attrValues (searchImportSet "scripts.nix" argSet'));

  home.sessionVariables = {
  } // searchImportSet "session-vars.nix" argSet';
  home.file = searchImportSet "home-symlinks.nix" argSet';

  programs = dirToImportSet ./programs argSet';
  services = dirToImportSet ./services argSet';

  # Enable stuff
  imports = [
    { programs = enabledStuff.programs; }
    { services = enabledStuff.services; }
    enabledStuff.others
  ];
} // (dirToImportSet ./others argSet')
