{ config
, extra
, ...
}:

let
  inherit (extra)
    XDG_GIT_REPOS_DIR;
in
{
  includes = [{
    condition = "gitdir:${XDG_GIT_REPOS_DIR}/securitas/**";
    contents = {
      user = {
        email = "alberto.rgomez@securitasdirect.es";
        name = "alberto.rgomez";
        signingKey = "6C3A5D97ED385F2D";
      };
      commit.gpgSign = true;
    };
  }];

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

    push = {
      autoSetupRemote = true;
    };
  };
}
