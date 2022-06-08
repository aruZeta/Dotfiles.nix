{ pkgs
, enabledStuff
, usefulExpresions
, ...
}:

with pkgs;
usefulExpresions.condAndValuesList [
  { cond = enabledStuff.programs.emacs.enable;
    vals = [
      nodePackages.vscode-langservers-extracted
    ];
  }
]
