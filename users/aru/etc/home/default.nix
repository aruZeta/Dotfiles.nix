{ pkgs
, ...
}:

{
  # Enable home-manager
  programs.home-manager.enable = true;

  home = {
    username = "aru";
    homeDirectory = "/home/aru";
    # Current unstable version
    stateVersion = "21.11";
    packages = with pkgs; [
      # Browser
      firefox

      # Window Manager stuff
      swaylock
      swayidle
      mako
      wofi
      wl-clipboard
      brightnessctl

      # Git stuff
      git-crypt

      # Fonts
      iosevka-bin
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
    ];
  };
}
