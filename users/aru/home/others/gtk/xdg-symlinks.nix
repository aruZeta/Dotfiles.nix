{ config
}:

if config.gtk.enable
then {
  "Trolltech.conf".source = ./symlinked/Trolltech.conf;
}
else {}
