# Auto-generated from "home-manager.org"
{ pkgs
, lib
, config
, ...
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
  programs.eclipse = {
    enable = true;
    package = pkgs.eclipses.eclipse-java;
  };
  programs.emacs = {
    enable = true;
  
    # Emacs pure gtk package
    package = pkgs.emacsPgtk;
  
    # Override org package to use elpa instead of builtin
    overrides = self: super: {
      org = self.elpaPackages.org;
    };
  
    # No use-package
    extraPackages = (epkgs: with epkgs; [
      company
      company-lua
  
      counsel
  
      emmet-mode
      lsp-mode
      lua-mode
      nix-mode
      web-mode
  
      lsp-ivy
      # lsp-java
      lsp-treemacs
      lsp-ui
  
      evil
      evil-collection
  
      ivy
      ivy-rich
  
      flycheck
      treemacs
      projectile
  
      general
      which-key
  
      magit
      pinentry
  
      gruvbox-theme
      org-superstar
      visual-fill-column
      doom-modeline
  
      htmlize
  
      # To make sure that mu is in load-path, since it seems there are people
      # reporting it doesn't appear in their's, no problem in mine tho
      pkgs.mu
      mu4e-alert
  
      # Idk why this is here, tho its interesting
      # yasnippet
  
      all-the-icons
      all-the-icons-dired
      all-the-icons-ivy-rich
      treemacs-all-the-icons
  
      svg-tag-mode
    ]);
  };
  
  xdg.configFile = {
    "emacs/init.el".source = ./init.el;
    "emacs/startup.org".source = ./startup.org;
    "emacs/config.org".source = ./config.org;
  };
  programs.mu.enable = true;
  programs.mbsync.enable = true;
  
  # services.mbsync = {
  #   enable = true;
  #   frequency = "*-*-* *:*:00";
  #   postExec = "${pkgs.mu}/bin/mu index";
  # };
  
  accounts.email = {
    maildirBasePath =
      let mailHome =
            builtins.elemAt
              (builtins.split
                "\\$HOME/"
                config.xdg.userDirs.extraConfig.XDG_MAIL_DIR)
              2;
      in mailHome;
  
    accounts = {
      aru =
        let email = "aru_hackZ.official@zohomail.eu";
            imapHost = "imap.zoho.eu";
        in {
          address = email;
          userName = email;
          realName = "Alberto Robles Gomez";
          primary = true;
          mu.enable = true;
  
          passwordCommand =
            let keysDir = config.xdg.userDirs.extraConfig.XDG_KEYS_DIR;
            in "gpg --quiet --decrypt ${keysDir}/${imapHost}/${email}.gpg";
  
          folders = {
            drafts = "Drafts";
            inbox = "Inbox";
            sent = "Sent";
            trash = "Trash";
          };
  
          signature = {
            showSignature = "append";
            text = "\n------\nBy aru\n";
          };
  
          gpg = {
            signByDefault = true;
            key = "3A581BDE765C0DFA";
          };
  
          imap = {
            host = imapHost;
            port = 993;
          };
  
          smtp = {
            host = "smtp.zoho.eu";
            port = 465;
          };
  
          mbsync = {
            enable = true;
            create = "both";
            expunge = "both";
          };
        };
    };
  };
  xdg.configFile = {
    "eww/eww.yuck".text =
      ''
      (defwindow Test1
        :monitor 0
        :geometry (geometry :x "0%"
                            :y "0%"
                            :width "60%"
                            :height "60%"
                            :anchor "center")
        :stacking "bottom"
        :exclusive false
        :focusable true
        (cpu-usage))
      
      (defwidget cpu-usage []
        (box :class "cpu-usage"
             :space-evenly true
             :halign "start"
             :valign "start"
          (circular-progress :value {EWW_CPU.avg}
                             :start-at 25
                             :width 100
                             :height 100
                             :thickness 5.0
                             :clockwise true
            (label :text "CPU"))))
      '';
  
    "eww/eww.scss".text =
      ''
      /* Nothing */
      '';
  };
  programs.git = {
    enable = true;
  
    # Don't spam me :P
    userEmail = "aru_hackZ.official@zohomail.eu";
    userName = "aru-hackZ";
  
    # PGP signing
    signing.signByDefault = true;
    signing.key = "62F49107DB7386A7";
  
    # Global git ignores
    ignores = [
      "*~"
    ];
  
    # Extra git config
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };
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
  gtk = {
    enable = true;
  
    font = {
      name = "Iosevka Term";
      size = 12;
    };
  
    iconTheme = {
      package = pkgs.gruvbox-dark-icons-gtk;
      name = "oomox-gruvbox-dark";
    };
  
    theme = {
      package = pkgs.gruvbox-dark-gtk;
      name = "gruvbox-dark";
    };
  };
  
  xdg.configFile."Trolltech.conf".text =
    ''
    [Qt]
    style=GTK+
    '';
  # Enable home-manager
  programs = {
    home-manager.enable = true;
  };
  
  home = {
    username = "aru";
    homeDirectory = "/home/aru";
  
    # Current unstable version
    stateVersion = "21.11";
  
    packages =
      with pkgs;
      let
        my-python-pkgs = python-packages: with python-packages; [
          tkinter
        ];
        my-python = pkgs.python39.withPackages my-python-pkgs;
      in [
        # Browser
        firefox
  
        # Window Manager stuff
        swaylock
        swayidle
        mako
        libnotify
        wofi
        slurp
        grim
        wl-clipboard
        brightnessctl
        eww-wayland-master
  
        libsForQt5.qtstyleplugins
        qt5ct
  
        # Git stuff
        git-crypt
  
        # Fonts
        iosevka
        (nerdfonts.override { fonts = [ "Iosevka" ]; })
        noto-fonts
        noto-fonts-cjk
        noto-fonts-emoji
        emacs-all-the-icons-fonts
  
        # Some stuff needed for emacs && other programs
        # TODO: move this to a better place / better way to set it
        nodePackages.vscode-css-languageserver-bin
        nodePackages.vscode-html-languageserver-bin
        my-python
  
        # Utilities
        sass
        unzip
        pavucontrol
        xdg-user-dirs
      ];
  };
  # ... nothing to say here
  programs.java = {
    enable = true;
  };
  programs.neovim = {
    enable = true;
  
    # Neovim nightly, for the ones who want to compile it each morning
    # TODO: pin the $!@$% package, tired of recompiling
    package = pkgs.neovim-nightly;
  
    # Extra config, using lua
    extraConfig =
      ''
      lua << EOF
      vim.opt.number = true
      vim.opt.relativenumber = true
      vim.opt.title = true
      vim.opt.hidden = true
      vim.opt.backup = false
      vim.opt.writebackup = false
      vim.opt.showmode = false
      vim.opt.wrap = false
      vim.opt.updatetime = 300
      vim.opt.encoding = 'UTF-8'
      vim.opt.tabstop = 8
      vim.opt.shiftwidth = 8
      vim.opt.softtabstop = 0
      vim.opt.expandtab = false
      vim.opt.colorcolumn = '80'
      vim.opt.filetype = 'on'
      vim.opt.spelllang = { 'en', 'es' }
      vim.opt.shortmess = vim.opt.shortmess + { c = true }
      vim.opt.termguicolors = true
      vim.opt.mouse = 'a'
      EOF
      '';
  };
  nixpkgs.overlays = [
    # Neovim nightly overlay
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
  
    # Emacs overlay
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/emacs-overlay/archive/master.tar.gz;
    }))
  
    (
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
    )
  ];
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  
    extraSessionCommands =
      ''
      export SDL_VIDEODRIVER=wayland
      export QT_QPA_PLATFORM=wayland
      export QT_QPA_PLATFORMTHEME=qt5ct
      export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
      export _JAVA_AWT_WM_NONREPARENTING=1
      export MOZ_ENABLE_WAYLAND=1
      export GDK_BACKEND=wayland
      export GDK_DPI_SCALE=1
      '';
  
    # Sway config
    config = {
      modifier = "Mod4";
      menu = "${pkgs.wofi}/bin/wofi";
      terminal = "${pkgs.alacritty}/bin/alacritty";
      workspaceAutoBackAndForth = true;
  
      # TODO: reassign all default keybindings
      # left = "h";
      # down = "t";
      # up = "n";
      # right = "s";
      keybindings =
        let mod = config.wayland.windowManager.sway.config.modifier;
        in lib.mkOptionDefault {
          "${mod}+Return" = "exec ${pkgs.alacritty}/bin/alacritty";
          "${mod}+Shift+s" = "exec ${config.xdg.userDirs.extraConfig.XDG_DOTFILES_DIR}/bin/screenshot.sh";
          "${mod}+Shift+w" = "kill";
          "${mod}+Escape" = "exec swaylock -f";
          "${mod}+Shift+Escape" = "exec swaynag -t warning -m 'End session?' -b 'Yes, exit sway' 'swaymsg exit'";
          "Mod1+Space" = "exec ${pkgs.wofi}/bin/wofi --show drun";
          "XF86MonBrightnessUp" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set +2%";
          "XF86MonBrightnessDown" = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 2%-";
        };
  
      gaps = {
        inner = 5;
      };
  
      input = {
        "18003:1:foostan_Corne" = {
          xkb_layout = "us";
          xkb_numlock = "disabled";
        };
  
        "type:keyboard" = {
          xkb_layout = "dvorak";
          xkb_numlock = "enabled";
        };
      };
  
      output = {
        "eDP-1" = {
          resolution = "1366x768@60Hz";
          position = "0,0";
        };
  
        "HDMI-A-1" = {
          resolution = "1920x1080@60Hz";
          position = "1366,0";
        };
  
        "*" = {
          bg = "#1d2021 solid_color";
        };
      };
  
      startup = [
        { command =
            ''
            exec swayidle -w \
                 timeout 300 'swaylock -f' \
                 timeout 305 'swaymsg "output * dpms off"' resume 'swaymsg "output * dpms on"' \
                 before-sleep 'swaylock -f'
            '';
        }
      ];
  
      bars = [{
        command = "${pkgs.waybar}/bin/waybar";
      }];
    };
  };
  xdg.configFile = {
    "swaylock/config".text =
      ''
      show-failed-attempts
      ignore-empty-password
      
      image=$(xdg-user-dir DOTFILES)/share/img/black-hole.jpg
      scaling=stretch
      color=000000
      
      font=Iosevka
      font-size=16
      
      indicator-radius=60
      indicator-thickness=6
      
      inside-color=1d2021ff
      inside-clear-color=1d2021ff
      inside-caps-lock-color=1d2021ff
      inside-ver-color=1d2021ff
      inside-wrong-color=1d2021ff
      
      key-hl-color=689d6aff
      bs-hl-color=d79921ff
      
      ring-color=282828ff
      ring-clear-color=8ec07cff
      ring-caps-lock-color=fe8019ff
      ring-ver-color=b8bb26ff
      ring-wrong-color=fb4934ff
      
      line-color=00000000
      line-clear-color=00000000
      line-caps-lock-color=00000000
      line-ver-color=00000000
      line-wrong-color=00000000
      
      separator-color=00000000
      
      text-color=ebdbb2ff
      text-clear-color=689d6aff
      text-caps-lock-color=d65d0eff
      text-ver-color=98971aff
      text-wrong-color=cc241dff
      '';
  };
  programs.waybar = {
    enable = true;
    style =
      ''
      *{
      	border: none;
      	border-radius: inherit;
      	margin: 0;
      	padding: 0;
      	font-family: 'Iosevka Term', monospace;
      	font-weight: 700;
      	font-size: 13px;
      	background: none;
      	background-color: inherit;
      	box-shadow: none;
      	text-shadow: none;
      }
      
      #workspaces,
      #clock,
      #idle_inhibitor,
      #cpu,
      #temperature,
      #memory,
      #backlight,
      #disk,
      #battery,
      #network,
      #pulseaudio,
      #window {
      	padding: 0 10px;
      	background-color: #282828;
      	border-radius: 15px;
      	margin-left: 10px;
      }
      
      #window {
      	color: #ebdbb2;
      }
      
      #workspaces {
      	padding: 0;
      	margin: 0;
      }
      
      #workspaces button {
      	min-width: 30px;
      	color: #b16286;
      	border-radius: 15px;
      }
      
      #workspaces button:hover {
      	background-color: #3c3836;
      }
      
      #workspaces button.focused {
      	color: #98971a;
      }
      
      #clock,
      #idle_inhibitor {
      	color: #b16286;
      }
      
      #cpu,
      #backlight,
      #battery,
      #pulseaudio {
      	color: #689d6a;
      }
      
      #memory,
      #disk,
      #network,
      #temperature {
      	color: #458588;
      }
      
      #temperature.critical {
      	color: #cc241d;
      }
      '';
  
    settings = [{
      height = 30;
      layer = "top";
      margin = "5 5 0";
      modules-left = [ "sway/workspaces" "sway/window" ];
      modules-center = [ "clock" "idle_inhibitor" ];
      modules-right = [ "cpu" "memory" "backlight" "disk" "battery" "network" "pulseaudio" "temperature" ];
  
      modules =
        let big = text: "<span font='17' rise='-3000'>" + text + "</span>";
        in {
          "sway/workspaces" = {
            format = ''${big "{icon}"}'';
  
            format-icons = {
              "1" = "";
              "2" = ""; # I need an emacs icon
              "3" = "";
              "4" = ""; # There is no vbox icon
              "5" = "";
              "6" = "";
              "7" = "";
              "8" = ""; # Random stuff
              "9" = "ﭮ";
              "urgent" = "";
              "focused" = "";
              "default" = "";
            };
          };
  
          "sway/window" = {
            format = "{}";
            format-alt = ''${big ""}'';
            max-length = 80;
            tooltip = false;
  
            rewrite = {
              "(.*) — Mozilla Firefox" = ''${big ""} $1'';
              "(.*) — Mozilla Firefox \\(Private Browsing\\)" = ''${big " ﴣ"} $1'';
              "(.*) - GNU Emacs.*" = ''${big ""} $1'';
              "(.*) - Eclipse IDE.*" = ''${big ""} $1'';
              "(.*) - Oracle VM VirtualBox" = ''${big ""} $1'';
            };
          };
  
          clock = {
            interval = 1;
            format = ''{:%H:%M:%S} ${big ""}'';
            format-alt = ''{:%A %d, %B %Y} ${big ""}'';
            tooltip = false;
          };
  
          cpu = {
            interval = 5;
            format = ''${big " "}'';
            format-alt = ''{usage}% ${big ""}'';
            tooltip = false;
          };
  
          memory = {
            interval = 5;
            format = ''${big " "}'';
            format-alt = ''{used:0.1f}G/{total:0.1f}G ${big ""}'';
            tooltip = false;
          };
  
          backlight = {
            interval = 5;
            format = ''${big " {icon}"}'';
            format-alt = ''{percent}% ${big "{icon}"}'';
            format-icons = [ "" "" ];
            tooltip = false;
            on-scroll-up = "exec ${pkgs.brightnessctl}/bin/brightnessctl set +1%";
            on-scroll-down = "exec ${pkgs.brightnessctl}/bin/brightnessctl set 1%-";
          };
  
          disk = {
            interval = 30;
            format = ''${big " "}'';
            format-alt = ''{used}/{total} ${big ""}'';
            path = "/";
            tooltip = false;
          };
  
          battery = {
            interval = 60;
            bat = "BAT1";
            format = ''${big " {icon}"}'';
            format-alt = ''{capacity}% ${big "{icon}"}'';
            format-icons = [ "" "" "" "" "" ];
            tooltip = false;
          };
  
          idle_inhibitor = {
            format = ''${big "{icon}"}'';
            tooltip = false;
            on-click-right = "exec swaylock -f";
            on-click-middle = "exec swayidle timeout 1 'swaylock -f' timeout 2 'swaymsg \"output * dpms off\"' resume 'swaymsg \"output * dpms on\" && pkill -n swayidle' before-sleep 'swaylock -f'";
  
            format-icons = {
              activated = "";
              deactivated = "";
            };
          };
  
          network = {
            interval = 5;
            format-wifi = ''${big " 直"}'';
            format-ethernet = ''${big " "}'';
            format-disconnected = ''${big ""}'';
            format-alt = ''{essid}: {ipaddr} | {bandwidthUpBits} ${big ""} {bandwidthDownBits} ${big ""}'';
            tooltip = false;
          };
  
          pulseaudio = {
            format = ''${big " {icon}"}'';
            format-muted = ''${big "  {icon}"}'';
            format-source-muted = ''${big "  {icon}"}'';
            format-alt = ''{volume}% {format_source} ${big "{icon}"}'';
            tooltip = false;
            on-click-right = "exec ${pkgs.pulseaudio}/bin/pactl set-sink-mute @DEFAULT_SINK@ toggle";
            on-click-middle = "exec ${pkgs.pavucontrol}/bin/pavucontrol";
  
            format-icons = {
              headphone = "";
              headset = "";
              hands-free = "";
              speaker = "蓼";
              hifi = "醙";
              hdmi = "﴿";
              phone = "";
              portable = "";
              car = "";
              default = [ "" "" "" ];
            };
          };
  
          temperature = {
            interval = 5;
            format = ''${big " {icon}"}'';
            format-alt = ''{temperatureC}°C ${big "{icon}"}'';
            format-icons = [ "" "" "" "" ];
            tooltip = false;
            critical-threshold = 80;
          };
        };
    }];
  };
  xdg.configFile = {
    "wofi/config".text =
      ''
      width=40%
      lines=8
      
      allow_images=true
      image_size=24
      
      term=alacritty
      
      prompt=
      insensitive=true
      '';
  
    "wofi/style.css".text =
      ''
      window {
      	border-radius: 15px;
      }
      
      #outer-box {
      	padding: 5px;
      }
      
      #inner-box {
      	margin-right: 15px;
      }
      
      #input {
      	border-radius: 15px;
      	padding: 5px;
      	border: none;
      }
      
      #scroll {
      	margin-top: 5px;
      }
      
      #entry {
      	border-radius: 15px;
      	padding: 5px;
      	outline: none;
      }
      
      #text {
      	font-weight: 700;
      }
      
      #img {
      	margin-right: 5px;
      }
      '';
  };
  xdg = {
    enable = true;
  
    configHome = ~/.dotfiles/config;
    cacheHome = ~/.dotfiles/cache;
    dataHome = ~/.dotfiles/local/share;
    stateHome = ~/.dotfiles/local/state;
  
    userDirs = {
      enable = true;
      desktop = "$HOME/Tmp/Desktop";
      documents = "$HOME/Archive";
      download = "$HOME/Tmp";
      music = "${config.xdg.userDirs.documents}/Audio";
      pictures = "${config.xdg.userDirs.documents}/Images";
      templates = "${config.xdg.userDirs.documents}/Templates";
      videos = "${config.xdg.userDirs.documents}/Video";
  
      extraConfig = {
        XDG_DOTFILES_DIR = "$HOME/Dotfiles.nix";
        XDG_MAIL_DIR = "${config.xdg.userDirs.documents}/Mail";
        XDG_KEYS_DIR = "${config.xdg.userDirs.documents}/Keys";
      };
    };
  };
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    autocd = true;
  
    # Gets rid of the $HOME part of $XDG_CONFIG_HOME
    # Since zDotDir is a relative path to $HOME
    dotDir =
      let configHome =
            builtins.elemAt
              (builtins.split
                "${config.home.homeDirectory}/"
                "${builtins.toString config.xdg.configHome}")
              2;
      in "${configHome}/zsh";
  
    history = {
      extended = true;
      ignoreSpace = true;
      ignorePatterns = [
        "l"
        "kill *"
      ];
      save = 99999;
      size = 99999;
      path = "${config.xdg.dataHome}/zsh/history";
    };
  
    shellAliases = {
      "l" = "ls --color=always --group-directories-first -lhA";
    };
  
    shellGlobalAliases = {
      G = "| grep";
      L = "| less";
    };
  
    sessionVariables = {
      STARSHIP_CACHE = "${config.xdg.cacheHome}/starship/history";
    };
  
    initExtra =
      ''
      bindkey "^[[1;5C" forward-word
      bindkey "^[[1;5D" backward-word
      bindkey "\e[3~"   delete-char
      '';
  };
}
