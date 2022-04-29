{ enabledStuff
, usefulExpresions
, ...
}:

usefulExpresions.condAndValuesSet [
  { cond = enabledStuff.others.gtk.enable;
    vals = {
      "Trolltech.conf".source = ./symlinked/Trolltech.conf;
    };
  }
]
