{ ...
}:

{
  programs.texlive = {
    extraPackages = tpkgs: {
      inherit (tpkgs) scheme-full;
    };
  };
}
