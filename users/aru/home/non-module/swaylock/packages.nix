{ pkgs
}:

with pkgs; [
] ++ (
  if (import ../../enable.nix {}).non-module.swaylock.enable
  then  [
    swaylock
  ]
  else []
)
