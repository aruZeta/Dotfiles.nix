{ config
, ...
}:

let
  inherit (config.xdg.userDirs.extraConfig)
    XDG_MAIL_DIR;
in

{
  email = {
    maildirBasePath = XDG_MAIL_DIR;
    accounts = {
      aru =
        let email = "alberto.robles.gomez@kairosds.com";
        in {
          address = email;
          userName = email;
          realName = "Alberto Robles Gomez";
          primary = true;
        };
    };
  };
}
