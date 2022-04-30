{ pkgs
, enabledStuff
, usefulExpresions
, ...
}:

with pkgs;
usefulExpresions.condAndValuesList [
  { cond = true;
    vals = [
      iosevka
      (nerdfonts.override { fonts = [ "Iosevka" ]; })
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      emacs-all-the-icons-fonts
    ];
  }
]
