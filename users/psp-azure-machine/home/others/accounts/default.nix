{ config
, ...
}:

let
  inherit (config.xdg.userDirs.extraConfig)
    XDG_KEYS_DIR
    XDG_MAIL_DIR;
in

{
  email = {
    maildirBasePath = XDG_MAIL_DIR;
    accounts = {
      aru =
        let email = "aru_hackZ.official@zohomail.eu";
            imapHost = "imap.zoho.eu";
        in {
          address = email;
          userName = email;
          realName = "Alberto Robles Gomez";
          primary = true;
        };
    };
  };
}
