{ pkgs
, config
, ...
}:

{
  programs.home-manager.enable = true;
  home.stateVersion = "22.05";

  home.packages = with pkgs;
    let scripts = import ./scripts {inherit pkgs config;};
    in [
      scripts.apply-system
      scripts.apply-user
      scripts.update-system
      scripts.update-user
    ];

  imports = [
    # Import your user specific config
    ../users/aru/home
  ];
}
