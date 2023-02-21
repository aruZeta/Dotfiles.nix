{ config
, ...
}:

{
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
