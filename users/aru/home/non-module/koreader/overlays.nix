{ enabledStuff
, usefulExpresions
, ...
}:

let
  inherit (enabledStuff.non-module.koreader)
    overlay;
in

usefulExpresions.condAndValuesList [
  { cond = overlay.enable;
    vals = [
      (self: super: {
        koreader = super.koreader.overrideAttrs(oldAttr: rec {
          version = overlay.version;
          
          src = super.fetchurl {
            url =
              let path = "releases/download/v${version}";
              in "${overlay.repo}/${path}/koreader-${version}-amd64.deb";
            sha256 = overlay.sha256;
          };
          
          unpackCmd = "dpkg-deb -x ${src} .";
        });
      })
    ];
  }
]
