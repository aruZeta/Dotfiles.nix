{ config
, pkgs
, lib
, enabledStuff
, ...
}:

(builtins.mapAttrs
  (name: value: (import (./. + "/${name}") {inherit config pkgs lib enabledStuff;}))
  (lib.filterAttrs
    (name: value: value == "directory")
    (builtins.readDir ./.)))
