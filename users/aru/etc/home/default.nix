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
      # Window Manager stuff
      swaylock
      swayidle
      mako
      wofi
      wl-clipboard
      brightnessctl
  };
}
