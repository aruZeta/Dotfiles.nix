{ pkgs
, config
, ...
}:

{
  programs.home-manager.enable = true;

  home.packages =
    []
    ++ (builtins.attrValues
      (import ./scripts pkgs config)
    );
}
