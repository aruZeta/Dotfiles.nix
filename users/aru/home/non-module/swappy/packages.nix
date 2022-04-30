{ pkgs
, enabledStuff
, usefulExpresions
, ...
}:

with pkgs;
usefulExpresions.condAndValuesList [
  { cond = enabledStuff.non-module.swappy.enable;
    vals = [
      slurp
      grim
      swappy
    ];
  }
]
