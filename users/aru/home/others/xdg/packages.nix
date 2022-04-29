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
  { cond = enabledStuff.others.xdg.userDirs.enable;
    vals = [
      xdg-user-dirs
    ];
  }
]
