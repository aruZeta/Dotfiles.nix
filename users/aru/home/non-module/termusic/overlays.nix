{ enabledStuff
, ...
}:

let overlay-cfg = enabledStuff.non-module.termusic.overlay;
in [] ++ (
  if overlay-cfg.enable
  then [
    (self: super: {
      termusic = super.termusic.overrideAttrs(oldAttr: rec {
        pname = oldAttr.pname;
        version = overlay-cfg.version;

        src = super.fetchCrate {
          inherit version pname;
          sha256 = overlay-cfg.sha256;
        };

        cargoDeps = oldAttr.cargoDeps.overrideAttrs (super.lib.const {
          inherit src;
          name = "${pname}-vendor.tar.gz";
          outputHash = overlay-cfg.cargoOutputHash;
        });
      });
    })
  ]
  else []
)
