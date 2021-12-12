{ pkgs
, ...
}:

{
  gtk = {
    enable = true;

    font = {
      name = "Iosevka Term";
      size = 12;
    };

    iconTheme = {
      package = pkgs.gruvbox-dark-icons-gtk;
      name = "oomox-gruvbox-dark";
    };

    theme = {
      package = pkgs.gruvbox-dark-gtk;
      name = "gruvbox-dark";
    };
  };

  xdg.configFile."Trolltech.conf".text =
    ''
    [Qt]
    style=GTK+
    '';
}
