{ pkgs
, enabledStuff
, usefulExpresions
, ...
}:

let
  inherit (enabledStuff.non-module.emacs)
    overlay;
in

usefulExpresions.condAndValuesList [
  { cond = overlay.enable;
    vals = [
      (import (builtins.fetchTarball {
        url = "${overlay.repo}/archive/${overlay.commit}.tar.gz";
      }))

      # (self: super: {
      #   emacsPgtk = super.emacsPgtk.overrideAttrs (oldAttrs: {
      #     patches = [
      #       ./others/center_lines_vertically.patch
      #     ];
      #   });
      # })
    ];
  }
]
