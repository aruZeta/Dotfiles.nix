{ pkgs
, lib
, enabledStuff
, usefulExpresions
, ...
}:

with pkgs;
usefulExpresions.condAndValuesSet [
  { cond = enabledStuff.programs.waybar.enable;
    vals = {
      swayidle-sleep-now = writeShellScriptBin "swayidle-sleep-now"
        (lib.strings.fileContents ./insertions/swayidle-sleep-now.sh);
    };
  }
]
