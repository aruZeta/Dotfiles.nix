{ config
, pkgs
, enabledStuff
, usefulExpresions
, ...
}:

let
  inherit (config.gtk)
    iconTheme;
in

usefulExpresions.condAndValuesSet [
  { cond = enabledStuff.non-module.netbeans.enable;
    vals = {
      netbeans = {
        name = "Netbeans IDE";
        genericName = "Integrated Development Environment";
        exec = "netbeans --jdkhome ${pkgs.jdk8}/lib/openjdk";
        categories = [ "Application" "Development" ];
      };
    };
  }
]
