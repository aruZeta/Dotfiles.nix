{ config
, pkgs
}:

{
  gtk = (import ./gtk {inherit pkgs;});
  xdg = (import ./xdg {inherit config pkgs;});
}
