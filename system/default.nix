{ ...
}:

{
  system.stateVersion = "22.11";

  imports = [
    # Import your user specific settings
    ../users/aru/system

    # Import your hardware settings
    ./hardware/msi-bravo-15-b5dd.nix
  ];
}
