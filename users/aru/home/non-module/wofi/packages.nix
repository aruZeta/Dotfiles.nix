{ pkgs
}:

with pkgs; [
] ++ (
  if (import ../../enable.nix {}).non-module.wofi.enable
  then  [
    wofi
  ]
  else []
)
