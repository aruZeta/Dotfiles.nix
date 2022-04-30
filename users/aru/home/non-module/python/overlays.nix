{ enabledStuff
, usefulExpresions
, ...
}:

let
  inherit (enabledStuff.non-module.python)
    overlay;
in

usefulExpresions.condAndValuesList [
  { cond = overlay.apsw-fix.enable;
    vals = [
      (final: prev:
        let
          packageOverrides = (pythonFinal: pythonPrev: {
            apsw = pythonPrev.apsw.overridePythonAttrs (oldAttrs: {
              version = "3.38.1-r1";
              src = prev.fetchFromGitHub {
                owner = "rogerbinns";
                repo = "apsw";
                rev = "3.38.1-r1";
                sha256 = "sha256-pbb6wCu1T1mPlgoydB1Y1AKv+kToGkdVUjiom2vTqf4=";
              };
              checkInputs = [];
              checkPhase = ''
                python tests.py
              '';
              pytestFlagsArray = [];
              disabledTests = [];
            });
          });
          python' = prev.python3.override { inherit packageOverrides; };
        in {
          calibre = prev.calibre.override { python3Packages = python'.pkgs; };
        })
    ];
  }
]
