{ pkgs
, config
, ...
}:

{
  programs.home-manager.enable = true;
  home.stateVersion = "22.05";

  home.packages =
    []
    ++ (builtins.attrValues
      (import ./scripts pkgs config)
    );

  imports = [
    # Import your user specific config
    ../users/aru/home
  ];
}
