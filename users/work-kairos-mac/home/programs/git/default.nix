{ config
, ...
}:

let
  inherit (config.xdg.userDirs.extraConfig)
    XDG_GIT_REPOS_DIR;
in
{
  userEmail = config.accounts.email.accounts.aru.address;
  userName = "alberto.robles.gomez";
  signing.signByDefault = true;
  signing.key = "74EADA26CC2814AB";

  ignores = [
    "*~"
  ];

  extraConfig = {
    init = {
      defaultBranch = "main";
    };
  };
}
