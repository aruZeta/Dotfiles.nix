{ enabledStuff
, usefulExpresions
, lib
, ...
}:

usefulExpresions.condAndValuesSet [
  { cond = enabledStuff.programs.emacs.enable;
    vals = {
      "emacs/init.el".text = builtins.concatStringsSep "\n" [
        (lib.strings.fileContents ./symlinked/init.el)
        (lib.strings.fileContents ./symlinked/init-expanded.el)
      ];
    };
  }
]
