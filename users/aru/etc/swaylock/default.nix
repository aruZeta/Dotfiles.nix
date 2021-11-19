{ config
, ...
}:

{
  home.file = {
    "${config.xdg.configHome}/swaylock/config".source = ./config;
  };
}
