{ pkgs
, enabledStuff
, ...
}:

with pkgs; [
] ++ (
  if enabledStuff.non-module.swaylock.enable
  then  [
    swaylock
  ]
  else []
)
