{ pkgs
, config
, enabledStuff
, usefulExpresions
, ...
}:

usefulExpresions.condAndValuesSet [
  { cond = enabledStuff.non-module.common-lisp.enable;
    vals = {
      NIX_QUICKLISP_DIR = "${config.xdg.dataHome}/quicklisp";
    };
  }
]
