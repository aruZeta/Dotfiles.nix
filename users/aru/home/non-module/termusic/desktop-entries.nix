{ config
, pkgs
, enabledStuff
, ...
}:

if enabledStuff.non-module.termusic.enable
then {
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
        folder = if config.gtk.theme.name == "gruvbox-dark"
                 then "oomox-gruvbox-dark"
                 else config.gtk.name;
        theme = "${config.gtk.theme.package}/share/icons/${folder}";
      in "${theme}/64x64/apps/multimedia-audio-player.svg";
  };
}
else {}
