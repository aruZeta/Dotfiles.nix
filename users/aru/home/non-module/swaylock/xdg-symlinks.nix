{
}:

if (import ../../enable.nix {}).non-module.swaylock.enable
then {
  "swaylock/config".source = ./symlinked/config.conf;
}
else {}
