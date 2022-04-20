pkgs:

{
  font = {
    name = "Iosevka";
    size = 12;
  };

  theme = {
    package = pkgs.gruvbox-dark-gtk;
    name = "gruvbox-dark";
  };

  iconTheme = {
    package = pkgs.gruvbox-dark-icons-gtk;
    name = "oomox-gruvbox-dark";
  };
}
