{ pkgs
, config
, ...
}:

{
  imports = [
    ./default.nix
    ../users/kairos/home
  ];
}
