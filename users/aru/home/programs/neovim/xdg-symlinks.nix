{ enabledStuff
, usefulExpresions
, ...
}:

usefulExpresions.condAndValuesSet [
  { cond = enabledStuff.non-module.swappy.enable;
    vals = {
      "nvim/init.vim".source = ./symlinked/init.vim;
    };
  }
]
