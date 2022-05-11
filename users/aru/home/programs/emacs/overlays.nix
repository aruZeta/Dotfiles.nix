{ enabledStuff
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

      (self: super: {
        emacsPgtkNativeComp = super.emacsPgtkNativeComp.overrideAttrs (oldAttrs: {
          patches = [
            (super.fetchpatch {
              # Vertical center line spacing
              url = "https://lists.gnu.org/archive/html/emacs-devel/2019-08/txtY68Nfh61tp.txt";
              sha256 = "sha256-CjRcbJfYwcVNsde5vvODBiQz9/9dD5br7P/1VbMV/b8=";
            })
          ];
        });
      })
    ];
  }
]
