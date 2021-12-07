{ pkgs
, config
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

  home.file."${config.xdg.configHome}/Trolltech.conf".text =
    ''
    [Qt]
    style=GTK+
    '';
}
