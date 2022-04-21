{ pkgs
, enabledStuff
, ...
}:

with pkgs; [
] ++ (
  if enabledStuff.others.xdg.enable
  then [
    xdg-utils
  ]
  else []
) ++ (
  if enabledStuff.others.xdg.userDirs.enable
  then [
    xdg-user-dirs
  ]
  else []
)
