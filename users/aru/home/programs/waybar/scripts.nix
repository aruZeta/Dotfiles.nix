{ pkgs
, lib
, enabledStuff
, ...
}:

with pkgs;
if enabledStuff.programs.waybar.enable
then {
  swayidle-sleep-now = writeShellScriptBin "swayidle-sleep-now"
    (lib.strings.fileContents ./insertions/swayidle-sleep-now.sh);
}
else {}
