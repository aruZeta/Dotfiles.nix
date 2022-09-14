{ pkgs
, ...
}:

{
  package = pkgs.eclipses.eclipse-jee;

  plugins = with pkgs.eclipses.plugins; [
    vrapper
  ];
}
