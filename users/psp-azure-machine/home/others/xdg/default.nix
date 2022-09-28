{ config
, usefulExpresions
, ...
} @ args:

let
  inherit (config.home)
    homeDirectory;
  inherit (config.xdg.userDirs)
    documents
    download;
  inherit (usefulExpresions)
    searchImportSet;
in

{
  configHome = "${homeDirectory}/.config";
  cacheHome  = "${homeDirectory}/.cache";
  dataHome   = "${homeDirectory}/.local/share";
  stateHome  = "${homeDirectory}/.local/state";

  configFile = searchImportSet "xdg-symlinks.nix" args;
  desktopEntries = searchImportSet "desktop-entries.nix" args;

  userDirs = {
    extraConfig = {
      XDG_DOTFILES_DIR = "${homeDirectory}/Dotfiles.nix";
    };
  };
}
