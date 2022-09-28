{ config
, lib
, ...
}:

{
  # Gets rid of the $HOME part of $XDG_CONFIG_HOME
  # Since zDotDir is a relative path to $HOME
  dotDir =
    let configHome =
          builtins.elemAt
            (builtins.split
              "${config.home.homeDirectory}/"
              config.xdg.configHome)
            2;
    in "${configHome}/zsh";

  history = {
    extended = true;
    ignoreSpace = true;
    ignorePatterns = [
      "l"
      "kill *"
    ];
    save = 99999;
    size = 99999;
    path = "${config.xdg.dataHome}/zsh/history";
  };

  shellAliases = {
    "l" = "ls --color=always --group-directories-first -lhA";
  };

  shellGlobalAliases = {
    G = "| grep";
    L = "| less";
  };

  sessionVariables = {
    STARSHIP_CACHE = "${config.xdg.cacheHome}/starship/history";
  };

  initExtra = lib.strings.fileContents ./insertions/initExtra.sh;

  oh-my-zsh.theme = "gnzh";
}
