{ pkgs
, config
, lib
}:

[] ++ (builtins.concatMap (val: builtins.attrValues val) [
  # Programs
  (import ./programs/waybar/scripts.nix {inherit pkgs config lib;})
])
