config: pkgs:

{
  gtk = (import ./gtk pkgs);
  xdg = (import ./xdg config pkgs);
}
