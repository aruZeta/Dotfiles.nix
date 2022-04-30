{ pkgs
, enabledStuff
, usefulExpresions
, ...
}:

with pkgs;
usefulExpresions.condAndValuesList [
  { cond = enabledStuff.non-module.plantuml.enable;
    vals = [
      plantuml
    ];
  }
]
