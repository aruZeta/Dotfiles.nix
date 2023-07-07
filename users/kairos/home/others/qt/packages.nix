{ pkgs
, enabledStuff
, usefulExpresions
, ...
}:

with pkgs;
usefulExpresions.condAndValuesList [
  { cond = enabledStuff.others.qt.enable;
    vals = [
      qt5ct
    ];
  }
]
