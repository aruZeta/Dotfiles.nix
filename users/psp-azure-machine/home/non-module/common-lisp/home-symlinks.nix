{ enabledStuff
, usefulExpresions
, ...
}:

usefulExpresions.condAndValuesSet [
  { cond = enabledStuff.non-module.common-lisp.enable;
    vals = {
      ".sbclrc".source = ./symlinked/sbclrc.lisp;
    };
  }
]
