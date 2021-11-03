{ ...
}:

{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    autocd = true;
    dotDir = ".config/zsh";

    history = {
      extended = true;
      ignoreDups = false;
      ignoreSpace = true;
      save = 99999;
      size = 99999;
    };

    shellAliases = {
      "l" = "ls -lhA";
    };
  };
}
