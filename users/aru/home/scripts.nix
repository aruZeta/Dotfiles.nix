{ config
, pkgs
, lib
, enabledStuff
, ...
}:

[] ++ (builtins.concatMap (val: builtins.attrValues val) [
  # Programs
  (import ./programs/waybar/scripts.nix {inherit config pkgs lib enabledStuff;})
])
