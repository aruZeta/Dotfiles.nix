{ lib
, ...
}:

{
  programs.waybar = {
    enable = true;
    style = lib.strings.fileContents ./style.css;
    settings = [{
      height = 30;
      layer = "top";
      margin = "5 5 0";
      modules-left = [ "sway/workspaces" ];
      modules-right = [ "clock" ];
      modules = {
        "sway/workspaces" = {
          format = "{icon}";
          format-icons = {
            "1" = "";
	    "2" = "";
	    "3" = "";
          };
        };
      };
    }];
  };
}
