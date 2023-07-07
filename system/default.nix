{ ...
}:

{
  imports = [
    # Import your user specific settings
    ../users/kairos/system

    # Import your hardware settings
    ./hardware/slimbook-prox14-amd.nix
  ];
}
