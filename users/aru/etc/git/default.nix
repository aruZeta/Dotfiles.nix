{ ...
}:

{
  programs.git = {
    enable = true;

    # Don't spam me :P
    userEmail = "aru_hackZ.official@zohomail.eu";
    userName = "aru-hackZ";

    # PGP signing
    signing.signByDefault = true;
    signing.key = "62F49107DB7386A7";

    # Global git ignores
    ignores = [
      "*~"
    ];

    # Extra git config
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };
}
