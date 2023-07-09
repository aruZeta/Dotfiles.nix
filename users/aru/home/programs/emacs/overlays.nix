{ pkgs
, emacs_23_07_09
, enabledStuff
, usefulExpresions
, ...
}:

let
  inherit (enabledStuff.programs)
    emacs;
in

usefulExpresions.condAndValuesList [
  { cond = emacs.enable;
    vals = [
      emacs_23_07_09.overlay

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
