{ config
, pkgs
, ...
}:

{
  programs.mu.enable = true;
  programs.mbsync.enable = true;

  # services.mbsync = {
  #   enable = true;
  #   frequency = "*-*-* *:*:00";
  #   postExec = "${pkgs.mu}/bin/mu index";
  # };

  accounts.email = {
    maildirBasePath =
      let mailHome =
            builtins.elemAt
              (builtins.split
                "\\$HOME/"
                config.xdg.userDirs.extraConfig.XDG_MAIL_DIR)
              2;
      in mailHome;

    accounts = {
      aru = {
        address = "aru_hackZ.official@zohomail.eu";
        userName = "aru_hackZ.official@zohomail.eu";
        realName = "Alberto Robles Gomez";
        primary = true;
        mu.enable = true;

        passwordCommand =
          let keysDir = config.xdg.userDirs.extraConfig.XDG_KEYS_DIR;
          in "gpg --quiet --decrypt ${keysDir}/email-passwd-aru.gpg";

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
          host = "imap.zoho.eu";
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
