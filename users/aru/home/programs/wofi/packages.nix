{ pkgs
, config
}:

with pkgs; [
] ++ (
  if (import ./default.nix {}).programs.wofi.enable
  then  [
    wofi
  ]
  else []
)
