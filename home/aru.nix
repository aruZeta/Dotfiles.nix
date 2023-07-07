{ pkgs
, config
, ...
}:

{
  imports = [
    ./default.nix
    ../users/aru/home
  ];
}
