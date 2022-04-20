config: pkgs: enabledStuff:

{
  gtk = (import ./gtk pkgs);
  xdg = (import ./xdg config pkgs enabledStuff);
}
