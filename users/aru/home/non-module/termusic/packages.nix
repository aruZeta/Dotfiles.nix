{ pkgs
, config
}:

with pkgs; [
] ++ (
  if (import ../../enable.nix {}).non-module.termusic.enable
  then  [
    termusic
  ]
  else []
)
