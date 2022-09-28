{ pkgs
, config
, ...
}:

{
  programs.home-manager.enable = true;
  home.stateVersion = "22.11";

  home.packages =
    []
    ++ (builtins.attrValues
      (import ./scripts pkgs config)
    );

  imports = [
    # Import your user specific config
    ../users/psp-azure-machine/home
  ];
}
