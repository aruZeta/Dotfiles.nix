self: super:
{
  eww-wayland-master = super.eww-wayland.overrideAttrs ( drv: rec {
    version = "master";
    src = super.fetchFromGitHub {
      owner = "elkowar";
      repo = "eww";
      rev = "${version}";
      sha256 = "1xyd21bd9k4hp0yjy480z0g41bz94ni49imvxqv1ffqxlvl52z5s";
    };

    cargoDeps = drv.cargoDeps.overrideAttrs (super.lib.const {
      inherit src;
      name = "eww-vendor.tar.gz";
      outputHash = "sha256-gXO82CUjSuOuuxYFdk7/NYMvCPv9CnkNyzIACWGLj0U=";
    });
  } );
}
