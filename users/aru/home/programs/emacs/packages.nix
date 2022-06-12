{ pkgs
, enabledStuff
, usefulExpresions
, ...
}:

with pkgs;
usefulExpresions.condAndValuesList [
  { cond = enabledStuff.programs.emacs.enable;
    vals = [
      # Need to figure out how to get this packages from a nix-shell to emacs
      nodePackages.vscode-langservers-extracted
      nodePackages.eslint
      nodejs
    ];
  }
]
