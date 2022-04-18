{ pkgs
, config
, ...
}:

{
  home = {
    username = "aru";
    homeDirectory = "/home/${config.home.username}";
  };

  home.packages = (import ./packages {inherit pkgs config;});

  xdg.configFile = (import ./symlinked {inherit config;}).xdg-symlinks;

  imports = [
    ./programs
  ];
}
