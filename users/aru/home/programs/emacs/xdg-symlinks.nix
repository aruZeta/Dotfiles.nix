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
      "emacs/my-libs".source = ./symlinked/my-libs;
      "emacs/expanded.el".text = ''
        (defvar sys/xdg-config-home "${configHome}")
        (defvar sys/xdg-publish-dir "${XDG_PUBLISH_DIR}")
        (defvar sys/xdg-mail-dir    "${XDG_MAIL_DIR}")
        (defvar sys/xdg-keys-dir    "${XDG_KEYS_DIR}")
        (defvar sys/xdg-org-dir     "${XDG_ORG_DIR}")
      '';
    };
  }
]
