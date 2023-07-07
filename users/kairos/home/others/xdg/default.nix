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
    desktop   = "${download}/Desktop";
    documents = "${homeDirectory}/Archive";
    download  = "${homeDirectory}/Tmp";
    music     = "${documents}/Audio";
    pictures  = "${documents}/Images";
    templates = "${documents}/Templates";
    videos    = "${documents}/Video";
    
    extraConfig = {
      XDG_DOTFILES_DIR  = "${homeDirectory}/Dotfiles.nix";
      XDG_PUBLISH_DIR   = "${homeDirectory}/Publish";
      XDG_MAIL_DIR      = "${documents}/Mail";
      XDG_KEYS_DIR      = "${documents}/Keys";
      XDG_ORG_DIR       = "${documents}/Org";
      XDG_GIT_REPOS_DIR = "/GitRepos";
    };
  };

  mimeApps = {
    defaultApplications = {
      "text/html" = "google-chrome.desktop";
      "x-scheme-handler/http" = "google-chrome.desktop";
      "x-scheme-handler/https" = "google-chrome.desktop";
      "x-scheme-handler/about" = "google-chrome.desktop";
      "x-scheme-handler/unknown" = "google-chrome.desktop";
    };
  };
}
