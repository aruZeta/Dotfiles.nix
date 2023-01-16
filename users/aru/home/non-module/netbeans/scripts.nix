{ pkgs
, lib
, enabledStuff
, usefulExpresions
, ...
}:

with pkgs;
usefulExpresions.condAndValuesSet [
  { cond = enabledStuff.non-module.netbeans.enable;
    vals = {
      netbeans8 = writeShellScriptBin "netbeans8"
        "netbeans --jdkhome ${pkgs.jdk8}/lib/openjdk";
    };
  }
]
