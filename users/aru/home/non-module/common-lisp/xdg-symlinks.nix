{ enabledStuff
, usefulExpresions
, ...
}:

usefulExpresions.condAndValuesSet [
  { cond = enabledStuff.non-module.common-lisp.enable;
    vals = {
      "common-lisp/source-registry.conf.d/asdf.conf".source =
        ./symlinked/asdf.conf;
    };
  }
]
