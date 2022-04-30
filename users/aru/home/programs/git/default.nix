{ config
, ...
}:

{
  userEmail = config.accounts.email.accounts.aru.address;
  userName = "aru-hackZ";
  signing.signByDefault = true;
  signing.key = "62F49107DB7386A7";

  ignores = [
    "*~"
  ];

  extraConfig = {
    init = {
      defaultBranch = "main";
    };
  };
}
