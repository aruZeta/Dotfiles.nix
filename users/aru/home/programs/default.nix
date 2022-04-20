pkgs: config: lib: enabledStuff:

{
  texlive = (import ./texlive);
  waybar = (import ./waybar pkgs config lib);
  zsh = (import ./zsh config lib);
}
