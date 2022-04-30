{ enabledStuff
, usefulExpresions
, ...
}:

let
  inherit (enabledStuff.non-module.termusic)
    overlay;
in

usefulExpresions.condAndValuesList [
  { cond = overlay.enable;
    vals = [
      (self: super: {
        termusic = super.termusic.overrideAttrs(oldAttr: rec {
          pname = oldAttr.pname;
          version = overlay.version;

          src = super.fetchCrate {
            inherit version pname;
            sha256 = overlay.sha256;
          };

          cargoDeps = oldAttr.cargoDeps.overrideAttrs (super.lib.const {
            inherit src;
            name = "${pname}-vendor.tar.gz";
            outputHash = overlay.cargoOutputHash;
          });
        });
      })
    ];
  }
]
