{ pkgs
, enabledStuff
, usefulExpresions
, ...
}:

let
  flake-compat = builtins.fetchTarball "https://github.com/edolstra/flake-compat/archive/master.tar.gz";
  webcord = (import flake-compat {
    src = builtins.fetchTarball "https://github.com/fufexan/webcord-flake/archive/master.tar.gz";
  }).defaultNix;
in

with pkgs;
usefulExpresions.condAndValuesList [
  { cond = enabledStuff.non-module.webcord.enable;
    vals = [
      webcord.packages.${pkgs.system}.default
    ];
  }
]
