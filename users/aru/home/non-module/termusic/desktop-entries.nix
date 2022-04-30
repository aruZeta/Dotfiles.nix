{ config
, pkgs
, enabledStuff
, usefulExpresions
, ...
}:

let
  inherit (config.gtk)
    iconTheme;
in

usefulExpresions.condAndValuesSet [
  { cond = enabledStuff.non-module.termusic.enable;
    vals = {
      termusic = {
        name = "Termusic";
        genericName = "Terminal Music Player";
        exec =
          let
            args = "--always-new-process --class termusic";
            term = "${pkgs.wezterm}/bin/wezterm start ${args}";
          in "${term} ${pkgs.termusic}/bin/termusic";
        categories = [ "Music" "AudioVideo" ];
        icon =
          let
            path = "${iconTheme.package}/share/icons/${iconTheme.name}";
          in "${path}/64x64/apps/multimedia-audio-player.svg";
      };
    };
  }
]
