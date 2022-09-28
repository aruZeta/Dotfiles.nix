{ pkgs
, enabledStuff
, usefulExpresions
, ...
}:

with pkgs;
usefulExpresions.condAndValuesList [
  { cond = enabledStuff.non-module.common-lisp.enable;
    vals = [
      sbcl
      lispPackages.quicklisp
      lispPackages.asdf
    ];
  }
]
