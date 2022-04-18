{ pkgs
, config
, lib
, ...
}:

{
  home = {
    username = "aru";
    homeDirectory = "/home/${config.home.username}";
  };

  home.packages =
    (import ./packages {inherit pkgs config;})
    ++ (import ./scripts {inherit pkgs config lib;});

  xdg.configFile = (import ./symlinked {inherit config;}).xdg-symlinks;

  imports = [
    ./programs
  ];
}
