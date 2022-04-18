{ pkgs
, config
}:

with pkgs; [
] ++ (
  if (import ./default.nix {}).programs.termusic.enable
  then  [
    termusic
  ]
  else []
)
