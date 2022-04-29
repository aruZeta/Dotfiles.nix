{ config
, pkgs
, enabledStuff
, usefulExpresions
, ...
}:

let
  inherit (config.gtk)
    theme;
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
            folder =
              if theme.name == "gruvbox-dark"
              then "oomox-gruvbox-dark"
              else config.gtk.name;
            path = "${theme.package}/share/icons/${folder}";
          in "${path}/64x64/apps/multimedia-audio-player.svg";
      };
    };
  }
]
