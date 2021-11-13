{ ...
}:

{
  programs.alacritty = {
    enable = true;

    # Alacritty config
    settings = {
      draw_bold_text_with_bright_colors = true;
      background_opacity = 0.8;
      live_config_reload = true;
      working_directory = "None";

      window = {
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
          family = "Iosevka Term";
          style = "Medium";
        };

        bold = {
          family = "Iosevka Term";
          style = "Bold";
        };

        italic = {
          family = "Iosevka Term";
          style = "Italic";
        };

        bold_italic = {
          family = "Iosevka Term";
          style = "Bold Italic";
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

      mouse_bindings = [
        { mouse = "Middle"; action = "PasteSelection"; }
      ];

      key_bindings = [
        { mods = "Control";       key = "L"; action = "ClearLogNotice"; }
        { mods = "Control|Shift"; key = "V"; action = "Paste"; }
        { mods = "Control|Shift"; key = "C"; action = "Copy"; }
      ];
    };
  };
}
