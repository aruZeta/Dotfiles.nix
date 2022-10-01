{ pkgs
, enabledStuff
, usefulExpresions
, ...
}:

with pkgs;
usefulExpresions.condAndValuesList [
  { cond = enabledStuff.programs.java.enable;
    vals = [
      tomcat9
    ];
  }
]
