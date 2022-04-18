{ config
, ...
}:

{
  xdg-symlinks =
    {}
    // (import ../programs/wofi/symlinked {inherit config;}).xdg-symlinks;

  home-symlinks =
    {};
}
