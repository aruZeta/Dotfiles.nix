{ pkgs
, enabledStuff
, usefulExpresions
, ...
}:

with pkgs;
usefulExpresions.condAndValuesList [
  { cond = enabledStuff.programs.gpg.enable;
    vals = [
      pkgs.pinentry_mac
    ];
  }
]
