{ pkgs
, config
, lib
}:

[] ++ (builtins.attrValues
  (import ./programs/waybar/scripts.nix {inherit pkgs config lib;})
)
