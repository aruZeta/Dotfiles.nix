{ enabledStuff
, usefulExpresions
, ...
}:

usefulExpresions.condAndValuesSet [
  { cond = enabledStuff.non-module.wofi.enable;
    vals = {
      "wofi/config".source = ./symlinked/wofi.conf;
      "wofi/style.css".source = ./symlinked/wofi.css;
    };
  }
]
