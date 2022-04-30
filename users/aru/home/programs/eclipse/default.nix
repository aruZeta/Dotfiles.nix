{ pkgs
, ...
}:

{
  package = pkgs.eclipses.eclipse-java;

  plugins = with pkgs.eclipses.plugins; [
    vrapper
  ];
}
