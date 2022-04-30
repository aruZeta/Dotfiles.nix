{ pkgs
, enabledStuff
, usefulExpresions
, ...
}:

usefulExpresions.condAndValuesSet [
  { cond = enabledStuff.non-module.plantuml.enable;
    vals = {
      PLANTUML_BIN = "${pkgs.plantuml}/bin/plantuml";
    };
  }
]
