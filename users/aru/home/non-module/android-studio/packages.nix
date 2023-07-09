{ pkgs
, enabledStuff
, usefulExpresions
, ...
}:

with pkgs;
usefulExpresions.condAndValuesList [
  { cond = enabledStuff.non-module.android-studio.enable;
    vals = [
      android-studio
    ];
  }
]
