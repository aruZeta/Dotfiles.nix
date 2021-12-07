{ config
, ...
}:

{
  xdg = {
    enable = true;

    configHome = ~/.dotfiles/config;
    cacheHome = ~/.dotfiles/cache;
    dataHome = ~/.dotfiles/local/share;
    stateHome = ~/.dotfiles/local/state;

    userDirs = {
      enable = true;
      desktop = "$HOME/Tmp/Desktop";
      documents = "$HOME/Archive";
      download = "$HOME/Tmp";
      music = "${config.xdg.userDirs.documents}/Audio";
      pictures = "${config.xdg.userDirs.documents}/Images";
      templates = "${config.xdg.userDirs.documents}/Templates";
      videos = "${config.xdg.userDirs.documents}/Video";

      extraConfig = {
        XDG_DOTFILES_DIR = "$HOME/Dotfiles.nix";
      };
    };
  };
}
