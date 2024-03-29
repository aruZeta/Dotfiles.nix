{ config
, enabledStuff
, usefulExpresions
, lib
, ...
}:

let
  inherit (config.xdg)
    configHome;
  inherit (config.xdg.userDirs.extraConfig)
    XDG_PUBLISH_DIR
    XDG_MAIL_DIR
    XDG_KEYS_DIR
    XDG_ORG_DIR;
in

usefulExpresions.condAndValuesSet [
  { cond = enabledStuff.programs.emacs.enable;
    vals = {
      "emacs/init.el".source = ./symlinked/init.el;
      "emacs/my-libs/aru".source = ./symlinked/my-libs/aru;
    };
  }
]
