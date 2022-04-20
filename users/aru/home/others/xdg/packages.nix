pkgs: config :

with pkgs; [
] ++ (
  if config.xdg.enable
  then [
    xdg-utils
  ]
  else []
) ++ (
  if config.xdg.userDirs.enable
  then [
    xdg-user-dirs
  ]
  else []
)
