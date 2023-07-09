{ pkgs
, config
, ...
}:

{
  home.packages = import ./scripts pkgs config;

  imports = [
    ../users/kairos/home
  ];
}
