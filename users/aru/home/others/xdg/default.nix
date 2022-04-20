config: pkgs: enabledStuff:

let homeDir = config.home.homeDirectory;
in {
  configHome = "${homeDir}/.dotfiles/config";
  cacheHome  = "${homeDir}/.dotfiles/cache";
  dataHome   = "${homeDir}/.dotfiles/local/share";
  stateHome  = "${homeDir}/.dotfiles/local/state";

  configFile = (import ../../xdg-symlinks.nix enabledStuff);
  desktopEntries = (import ../../desktop-entries.nix pkgs config enabledStuff);

  userDirs =
    let docsDir = config.xdg.userDirs.documents;
    in {
      desktop   = "${config.xdg.userDirs.download}/Desktop";
      documents = "${homeDir}/Archive";
      download  = "${homeDir}/Tmp";
      music     = "${docsDir}/Audio";
      pictures  = "${docsDir}/Images";
      templates = "${docsDir}/Templates";
      videos    = "${docsDir}/Video";

      extraConfig = {
        XDG_DOTFILES_DIR = "${homeDir}/Dotfiles.nix";
        XDG_PUBLISH_DIR  = "${homeDir}/Publish";
        XDG_MAIL_DIR     = "${docsDir}/Mail";
        XDG_KEYS_DIR     = "${docsDir}/Keys";
        XDG_ORG_DIR      = "${docsDir}/Org";
      };
    };

  mimeApps = {
    defaultApplications = {
      "application/lrf"      = [ "calibre-lrfviewer.desktop" ];
      "application/epub+zip" = [ "calibre-ebook-viewer.desktop" ];
    };
  };
}
