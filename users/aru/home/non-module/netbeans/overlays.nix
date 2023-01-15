{ enabledStuff
, usefulExpresions
, ...
}:

let
  inherit (enabledStuff.non-module.netbeans)
    overlay;
in

usefulExpresions.condAndValuesList [
  { cond = overlay.enable;
    vals = [
      (self: super: {
        netbeans = (import (builtins.fetchTarball {
          url = "https://github.com/nixos/nixpkgs/archive/57bccb3cb8f6b5dea5c315fcaabdb992498b9314.tar.gz";
          sha256 = "sha256:029zngpksb7i3bk6d7j3w073qrcph8g3ryh3zk25hg4xywilckp2";
        }) {}).netbeans;
      })
    ];
  }
]
