{ config
, ...
}:

let
  inherit (config.xdg.userDirs.extraConfig)
    XDG_GIT_REPOS_DIR;
in
{
  includes = [{
    condition = "gitdir:${XDG_GIT_REPOS_DIR}/work/kairos/**";
    contents = {
      user = {
        email = "alberto.robles.gomez@kairosds.com";
        name = "alberto.robles.gomez";
        signingKey = "74EADA26CC2814AB";
      };
      commit.gpgSign = true;
    };
  }];

  userEmail = config.accounts.email.accounts.aru.address;
  userName = "aruZeta";
  signing.signByDefault = true;
  signing.key = "A5B52CC3B6DDFB33";

  ignores = [
    "*~"
  ];

  extraConfig = {
    init = {
      defaultBranch = "main";
    };
  };
}
