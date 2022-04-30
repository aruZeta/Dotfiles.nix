{ enabledStuff
, usefulExpresions
, ...
}:

usefulExpresions.condAndValuesSet [
  { cond = enabledStuff.non-module.swappy.enable;
    vals = {
      "swappy/config".source = ./symlinked/config.conf;
    };
  }
]
