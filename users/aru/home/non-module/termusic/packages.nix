{ pkgs
, enabledStuff
, usefulExpresions
, ...
}:

with pkgs;
usefulExpresions.condAndValuesList [
  { cond = enabledStuff.non-module.termusic.enable;
    vals = [
      termusic
      yt-dlp
    ];
  }
]
