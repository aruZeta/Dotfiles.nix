{ pkgs
, config
, lib
, ...
}:

let enabledPrograms = (import ../enable.nix {}).programs;
in
builtins.mapAttrs (
  name: value:
  value // enabledPrograms."${name}" or {}
) {
  texlive = (import ./texlive {});
  waybar = (import ./waybar {inherit pkgs config lib;});
  zsh = (import ./zsh {inherit config lib;});
}
