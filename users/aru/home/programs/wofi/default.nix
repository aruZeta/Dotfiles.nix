{ lib
, ...
}:

{
  settings = {
    width = "40%";
    lines = 8;

    allow_images = true;
    image_size = 24;

    prompt = "";
    insensitive = true;

    term = "wezterm";
  };

  style = lib.strings.fileContents ./insertions/wofi.css;
}
