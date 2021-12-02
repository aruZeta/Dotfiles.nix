{ config
, ...
}:

{
  home.file = {
    "${config.xdg.configHome}/eww/eww.yuck".source = ./eww.yuck;
    "${config.xdg.configHome}/eww/eww.scss".source = ./eww.scss;
  };
}
