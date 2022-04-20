pkgs: config: lib: enabledStuff:

[] ++ (builtins.concatMap (val: builtins.attrValues val) [
  # Programs
  (import ./programs/waybar/scripts.nix pkgs config lib)
])
