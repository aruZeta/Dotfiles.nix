{ enabledStuff
, usefulExpresions
, ...
}:

usefulExpresions.condAndValuesList [
  { cond = true;
    vals = [
      (self: super: {
        my-android-studio = (import (builtins.fetchTarball {
          url = "https://github.com/nixos/nixpkgs/archive/f63a12f296b806a1b838d6fd8eef99fa65929649.tar.gz";
          sha256 = "sha256:0qbapbdv2xmlr8g51h4wi5w7kisp5p3fqc4iw923pykcvx24r8fw";
        }) { config.allowUnfree = true; }).androidStudioPackages.canary;
      })
    ];
  }
]
