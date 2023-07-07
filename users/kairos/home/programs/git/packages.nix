{ pkgs
, enabledStuff
, usefulExpresions
, ...
}:

with pkgs;
usefulExpresions.condAndValuesList [
  { cond = enabledStuff.programs.git.enable;
    vals = [
      git-crypt
    ];
  }
]
