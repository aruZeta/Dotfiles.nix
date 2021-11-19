{ config
, ...
}:

{
  home.file = {
    "${config.xdg.configHome}/wofi/config".source = ./config;
  };
}
