{ enabledStuff
, usefulExpresions
, pkgs
, ...
}:

usefulExpresions.condAndValuesSet [
  { cond = enabledStuff.programs.gpg.enable;
    vals = {
      ".gnupg/gpg-agent.conf".text = ''
        enable-ssh-support
        grab
        default-cache-ttl 28800
        default-cache-ttl-ssh 28800
        max-cache-ttl 28800
        max-cache-ttl-ssh 28800
        pinentry-program ${pkgs.pinentry_mac}/Applications/pinentry-mac.app/Contents/MacOS/pinentry-mac
      '';
      ".gnupg/sshcontrol".text = ''
        9F9BC86D61E29C3F97ACBF528223DB2B62D6741B
        A44FFE78F18C1248BDEBD829F10EBEC0116A5B26
      '';
    };
  }
]
