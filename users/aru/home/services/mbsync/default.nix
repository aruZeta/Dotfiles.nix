{ pkgs
, ...
}:

{
  frequency = "*-*-* *:*:00";
  postExec = "${pkgs.mu}/bin/mu index";
}
