{ enabledStuff
, usefulExpresions
, ...
}:

usefulExpresions.condAndValuesList [
  { cond = true;
    vals =
      let oldPkgs = (import (builtins.fetchTarball {
          url = "https://github.com/NixOS/nixpkgs/archive/eb63255e7ff4b7d6a388e7e00993c7f8cd6d2573.zip";
          sha256 = "sha256:1vwiqmgdf1055rkknx10qa7rv1z86j1fw49ji182ra8s4gf7r778";
        }) {});
      in [
      (self: super: {
        my-eclipse = oldPkgs.eclipses.eclipse-java;
      })
    ];
  }
]
