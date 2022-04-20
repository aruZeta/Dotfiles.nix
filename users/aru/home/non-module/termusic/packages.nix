pkgs: enabledStuff:

with pkgs; [
] ++ (
  if enabledStuff.non-module.termusic.enable
  then  [
    termusic
  ]
  else []
)
