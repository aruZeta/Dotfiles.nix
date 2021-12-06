{ config
, ...
}:

# Gets rid of the $HOME part of $XDG_CONFIG_HOME
# Since zDotDir is a relative path to $HOME
let configHome =
      builtins.elemAt
        (builtins.split
          "${config.home.homeDirectory}/"
          "${builtins.toString config.xdg.configHome}")
        2;
in
{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    autocd = true;

    # The path already has the `config.home.homeDir` at the start
    # so I need to take it off
    dotDir = "${configHome}/zsh";

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

    sessionVariables = {
      STARSHIP_CACHE = "${config.xdg.cacheHome}/starship/history";
    };
  };
}
