{ pkgs
, enabledStuff
, usefulExpresions
, ...
}:

with pkgs;
usefulExpresions.condAndValuesList [
  { cond = enabledStuff.non-module.python.enable;
    vals = [
      (let py-pkgs = python-packages: with python-packages; [
             tkinter
           ];
       in python39.withPackages py-pkgs)
    ];
  }
]
