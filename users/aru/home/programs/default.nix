pkgs: config: lib:

{
  texlive = (import ./texlive);
  waybar = (import ./waybar pkgs config lib);
  zsh = (import ./zsh config lib);
}
