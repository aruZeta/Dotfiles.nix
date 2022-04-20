if (import ../../enable.nix).non-module.wofi.enable
then {
  "wofi/config".source = ./symlinked/wofi.conf;
  "wofi/style.css".source = ./symlinked/wofi.css;
}
else {}
