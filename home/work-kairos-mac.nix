{ pkgs
, config
, ...
}:

{
  home.packages = import ./scripts/mac.nix pkgs config;

  imports = [
    ../users/work-kairos-mac/home
  ];
}
