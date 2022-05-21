{ enabledStuff
, usefulExpresions
, ...
}:

let
  inherit (enabledStuff.non-module.calibre)
    overlay;
in

usefulExpresions.condAndValuesList [
  { cond = overlay.enable;
    vals = [
      (self: super: {
        calibre = super.calibre.overrideAttrs(oldAttr: rec {
          version = overlay.version;

          src = super.fetchurl {
            url = "${overlay.repo}/${version}/${oldAttr.pname}-${version}.tar.xz";
            hash = overlay.sha256;
          };
        });
      })
    ];
  }
]
