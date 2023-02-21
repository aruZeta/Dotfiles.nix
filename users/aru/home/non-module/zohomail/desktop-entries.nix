{ config
, pkgs
, enabledStuff
, usefulExpresions
, ...
}:

usefulExpresions.condAndValuesSet [
  { cond = enabledStuff.non-module.zohomail.enable;
    vals = {
      zohomail = {
        name = "Zoho Mail";
        genericName = "Zoho Mail Client";
        exec =
          let
            appimage = pkgs.fetchurl {
              url = "https://downloads.zohocdn.com/zmail-desktop/linux/zoho-mail-desktop-x64-v1.5.4.AppImage";
              sha256 = "sha256-vdpfjVwmSNuYC/A6f3tPqdD3QZq9XYPBj1XONjLcPjQ=";
            };
          in "${pkgs.appimage-run}/bin/appimage-run ${appimage}";
        categories = [ "Network" "Email" ];
        icon =
          let
            img = pkgs.fetchurl {
              url = "https://img.zohostatic.eu/zmail/zm/357.2/images/mail-logo-128.png";
              sha256 = "sha256-ZWErbaoGyI+5OMAPxF25MslCoz6JZYssbSlfm8xcgLc=";
            };
          in "${img}";
      };
    };
  }
]
