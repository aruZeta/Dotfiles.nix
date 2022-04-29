{ enabledStuff
, usefulExpresions
, ...
}:

usefulExpresions.condAndValuesSet [
  { cond = enabledStuff.non-module.swaylock.enable;
    vals = {
      "swaylock/config".source = ./symlinked/config.conf;
    };
  }
]
