{ enabledStuff
, usefulExpresions
, ...
}:

usefulExpresions.condAndValuesSet [
  { cond = enabledStuff.non-module.wezterm.enable;
    vals = {
      "wezterm/wezterm.lua".source = ./symlinked/wezterm.lua;
    };
  }
]
