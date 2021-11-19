{ ...
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
      music = "$HOME/Archive/Audio";
      pictures = "$HOME/Archive/Images";
      templates = "$HOME/Archive/Templates";
      videos = "$HOME/Archive/Video";

      extraConfig = {
        XDG_DOTFILES_DIR = "$HOME/Dotfiles";
      };
    };
  };
}
