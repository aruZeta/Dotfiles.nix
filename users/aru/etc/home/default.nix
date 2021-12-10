{ pkgs
, ...
}:

{
  # Enable home-manager
  programs = {
    home-manager.enable = true;
  };

  home = {
    username = "aru";
    homeDirectory = "/home/aru";

    # Current unstable version
    stateVersion = "21.11";

    packages =
      with pkgs;
      let
        my-python-pkgs = python-packages: with python-packages; [
          tkinter
        ];
        my-python = pkgs.python39.withPackages my-python-pkgs;
      in [
        # Browser
        firefox

        # Window Manager stuff
        swaylock
        swayidle
        mako
        libnotify
        wofi
        slurp
        grim
        wl-clipboard
        brightnessctl
        eww-wayland-master

        libsForQt5.qtstyleplugins
        qt5ct

        # Git stuff
        git-crypt

        # Fonts
        iosevka
        (nerdfonts.override { fonts = [ "Iosevka" ]; })
        noto-fonts
        noto-fonts-cjk
        noto-fonts-emoji
        emacs-all-the-icons-fonts

        # Some stuff needed for emacs && other programs
        # TODO: move this to a better place / better way to set it
        nodePackages.vscode-css-languageserver-bin
        nodePackages.vscode-html-languageserver-bin
        my-python

        # Utilities
        sass
        unzip
        pavucontrol
        xdg-user-dirs
      ];
  };
}
