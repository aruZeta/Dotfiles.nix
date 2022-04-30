{ ...
}:

{
  settings = {
    window = {
      opacity = 0.8;
      title = "Alacritty";
      dynamic_title = true;

      padding = {
        x = 5;
        y = 5;
      };

      class = {
        instance = "Alacritty";
        general = "Alacritty";
      };
    };

    scrolling = {
      history = 10000;
      multiplier = 4;
    };

    font = {
      size = 12.0;

      normal = {
        family = "Iosevka";
        style = "Medium";
      };

      bold = {
        family = "Iosevka";
        style = "Bold";
      };

      italic = {
        family = "Iosevka";
        style = "Italic";
      };

      bold_italic = {
        family = "Iosevka";
        style = "Bold Italic";
      };
    };

    colors = {
      primary = {
        background = "0x1d2021";
        foreground = "0xebdbb2";
      };

      normal = {
        black =   "0x282828";
        red =     "0xcc241d";
        green =   "0x98971a";
        yellow =  "0xd79921";
        blue =    "0x458588";
        magenta = "0xb16286";
        cyan =    "0x689d6a";
        white =   "0xa89984";
      };

      bright = {
        black =   "0x928374";
        red =     "0xfb4934";
        green =   "0xb8bb26";
        yellow =  "0xfabd2f";
        blue =    "0x83a598";
        magenta = "0xd3869b";
        cyan =    "0x8ec07c";
        white =   "0xebdbb2";
      };
    };

    cursor = {
      blink_interval = 1000;
      unfocused_hollow = false;
      thickness = 1;

      style = {
        shape = "Block";
        blinking = "Never";
      };
    };

    mouse = {
      hide_when_typing = false;
      # hints.launcher.program = "";
    };

    key_bindings = [
      { mods = "Control";       key = "L"; action = "ClearLogNotice"; }
      { mods = "Control|Shift"; key = "V"; action = "Paste"; }
      { mods = "Control|Shift"; key = "C"; action = "Copy"; }
    ];

    mouse_bindings = [
      { mouse = "Middle"; action = "PasteSelection"; }
    ];

    live_config_reload = true;
    working_directory = "None";
    draw_bold_text_with_bright_colors = true;
  };
}
