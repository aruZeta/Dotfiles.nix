{ lib
, ...
} @args:

{
  emacs = {
    Unit.After = [ "graphical-session.target" ];
    Install.WantedBy = lib.mkForce [ "graphical-session.target" ];
  };
}

