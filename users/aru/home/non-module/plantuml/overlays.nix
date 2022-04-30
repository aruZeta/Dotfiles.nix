{ enabledStuff
, usefulExpresions
, ...
}:

let
  inherit (enabledStuff.non-module.plantuml)
    overlay;
in

usefulExpresions.condAndValuesList [
  { cond = overlay.enable;
    vals = [
      (self: super: {
        plantuml = super.plantuml.overrideAttrs(oldAttr: rec {
          version = overlay.version;

          src = super.fetchurl {
            url = "${overlay.repo}/${version}/plantuml.${version}.jar";
            sha256 = overlay.sha256;
          };
        });
      })
    ];
  }
]
