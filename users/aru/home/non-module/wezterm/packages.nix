pkgs:

with pkgs; [
] ++ (
  if (import ../../enable.nix).non-module.wezterm.enable
  then  [
    wezterm
  ]
  else []
)
