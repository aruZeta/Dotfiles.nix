{ enabledStuff
, usefulExpresions
, ...
}:

let
  inherit (enabledStuff.non-module.eww)
    overlay;
in

usefulExpresions.condAndValuesList [
  { cond = overlay.enable;
    vals = [
      (self: super: {
        eww-wayland = super.eww-wayland.overrideAttrs (oldAttrs: rec {
          version = overlay.version;

          src = super.fetchFromGitHub {
            owner = "elkowar";
            repo = "eww";
            rev = "${version}";
            sha256 = overlay.sha256;
          };

          cargoDeps = oldAttrs.cargoDeps.overrideAttrs (super.lib.const {
            inherit src;
            name = "eww-vendor.tar.gz";
            outputHash = overlay.cargoOutputHash;
          });
        });
      })
    ];
  }
]
