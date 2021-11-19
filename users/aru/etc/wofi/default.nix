{ config
, ...
}:

{
  home.file = {
    "${config.xdg.configHome}/wofi/config".source = ./config;
    "${config.xdg.configHome}/wofi/style.css".source = ./style.css;
  };
}
