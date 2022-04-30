{ pkgs
, enabledStuff
, usefulExpresions
, ...
}:

with pkgs;
usefulExpresions.condAndValuesList [
  { cond = enabledStuff.programs.emacs.enable;
    vals = [
      nodePackages.vscode-css-languageserver-bin
      nodePackages.vscode-html-languageserver-bin
    ];
  }
]
