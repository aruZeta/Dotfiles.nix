pkgs: enabledStuff:

with pkgs; [
] ++ (
  if enabledStuff.non-module.wezterm.enable
  then  [
    wezterm
  ]
  else []
)
