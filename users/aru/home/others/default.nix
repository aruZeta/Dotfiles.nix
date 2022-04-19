{ config
}:

{
  xdg = (import ./xdg {inherit config;});
}
