{ enabledStuff
, usefulExpresions
, ...
}:

usefulExpresions.condAndValuesList [
  { cond = true;
    vals =
      let oldPkgs = (import (builtins.fetchTarball {
          url = "https://github.com/NixOS/nixpkgs/archive/3228b0606c4b64943eb33e1643d4404851f082f9.zip";
          sha256 = "sha256:1fiyp064p9k0ybbq9nr60h4bq7cdnj46izjkrdbp00sb2gdyfgpj";
        }) {});
      in [
      (self: super: {
        eclipses.eclipse-jee = oldPkgs.eclipses.eclipse-jee;
        eclipses.eclipseWithPlugins = oldPkgs.eclipses.eclipseWithPlugins;
        eclipses.plugins = oldPkgs.eclipses.plugins;
      })
    ];
  }
]
