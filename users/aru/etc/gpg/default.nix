{ config
, ...
}:

{
  # Need me to introduce it?
  programs.gpg = {
    enable = true;
  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;

    # Dont judge me, im lazy
    defaultCacheTtl    = 3600 * 8;
    defaultCacheTtlSsh = 3600 * 8;

    pinentryFlavor = "emacs";
    extraConfig =
      ''
        allow-emacs-pinentry
      '';
  };
}