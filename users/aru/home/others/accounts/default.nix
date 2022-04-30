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
          mu.enable = true;

          passwordCommand =
            "gpg --quiet --decrypt ${XDG_KEYS_DIR}/${imapHost}/${email}.gpg";

          folders = {
            drafts = "Drafts";
            inbox = "Inbox";
            sent = "Sent";
            trash = "Trash";
          };

          signature = {
            showSignature = "append";
            text = "\n------\nBy aru\n";
          };

          gpg = {
            signByDefault = true;
            key = "3A581BDE765C0DFA";
          };

          imap = {
            host = imapHost;
            port = 993;
          };

          smtp = {
            host = "smtp.zoho.eu";
            port = 465;
          };

          mbsync = {
            enable = true;
            create = "both";
            expunge = "both";
          };
        };
    };
  };
}
