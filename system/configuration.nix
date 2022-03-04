{ config
, pkgs
, ...
}:

{
  imports = [
    ./hardware/msi-bravo-15-b5dd.nix

    # Import your user specific settings
    ../users/aru/system.nix
  ];
}
