{ pkgs
, enabledStuff
, ...
}:

with pkgs; [
] ++ (
  if enabledStuff.non-module.wofi.enable
  then  [
    wofi
  ]
  else []
)
