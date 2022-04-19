{ pkgs
, config
, lib
}:

{
  texlive = (import ./texlive {});
  waybar = (import ./waybar {inherit pkgs config lib;});
  zsh = (import ./zsh {inherit config lib;});
}
