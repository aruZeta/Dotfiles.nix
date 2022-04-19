{ config
, pkgs
}:

{
  xdg = (import ./xdg {inherit config pkgs;});
}
