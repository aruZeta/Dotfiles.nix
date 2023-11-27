{ config
, ...
} :

{
  PATH = "$PATH:${config.home.homeDirectory}/.rd/bin";
}
