{ config
, lib
, pkgs
, modulesPath
, ...
}:

{
  imports = [
    # Import your hardware settings
    ./hardware/slimbook-prox14-amd.nix
    ../users/kairos/system
  ];
}
