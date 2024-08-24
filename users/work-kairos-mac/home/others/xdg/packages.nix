{ pkgs
, enabledStuff
, usefulExpresions
, ...
}:

with pkgs;
usefulExpresions.condAndValuesList [
  { cond = enabledStuff.others.xdg.enable;
    vals = [
      xdg-utils
    ];
  }
]
