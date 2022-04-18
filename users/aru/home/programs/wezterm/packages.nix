{ pkgs
, config
}:

with pkgs; [
] ++ (
  if (import ./default.nix {}).programs.wezterm.enable
  then  [
    wezterm
  ]
  else []
)
