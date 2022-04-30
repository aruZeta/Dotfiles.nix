{ pkgs
, ...
}:

{
  package = pkgs.eww-wayland;
  configDir = ./symlinked;
}
