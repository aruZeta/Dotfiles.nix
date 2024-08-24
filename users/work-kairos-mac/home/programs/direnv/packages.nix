{ flakez
, enabledStuff
, usefulExpresions
, ...
}:

usefulExpresions.condAndValuesList [
  { cond = enabledStuff.non-module.direnv.flakez.enable;
    vals = [
      flakez.defaultPackage."aarch64-darwin"
    ];
  }
]
