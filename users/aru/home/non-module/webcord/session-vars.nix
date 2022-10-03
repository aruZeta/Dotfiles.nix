{ pkgs
, enabledStuff
, usefulExpresions
, ...
}:

usefulExpresions.condAndValuesSet [
  { cond = enabledStuff.non-module.webcord.enable;
    vals = {
      NIXOS_OZONE_WL = "1";
    };
  }
]
