{ pkgs
, lib
, enabledStuff
, usefulExpresions
, ...
}:

with pkgs;
usefulExpresions.condAndValuesSet [
  { cond = enabledStuff.others.wayland.windowManager.sway.enable;
    vals = {
      swayidle-sleep-timeout = writeShellScriptBin "swayidle-sleep-timeout"
        (lib.strings.fileContents ./insertions/swayidle-sleep-timeout.sh);
      sway-screenshot = writeShellScriptBin "sway-screenshot"
        (lib.strings.fileContents ./insertions/sway-sreenshot.sh);
      sway-exit = writeShellScriptBin "sway-exit"
        (lib.strings.fileContents ./insertions/sway-exit.sh);
    };
  }
]
