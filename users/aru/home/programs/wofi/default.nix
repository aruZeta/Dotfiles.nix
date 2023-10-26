{ lib
, ...
}:

{
  settings = {
    width = "40%";
    lines = 8;
    dynamic_lines = true;

    allow_images = true;
    image_size = 24;

    prompt = "";
    insensitive = true;
    parse_search = true;
    hide_search = false;

    term = "wezterm";
  };

  style = lib.strings.fileContents ./insertions/wofi.css;
}
