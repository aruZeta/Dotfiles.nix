{ enabledStuff
, ...
}:

if enabledStuff.others.gtk.enable
then {
  "Trolltech.conf".source = ./symlinked/Trolltech.conf;
}
else {}
