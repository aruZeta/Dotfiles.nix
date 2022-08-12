local wezterm = require 'wezterm';

return {
    enable_wayland = true,
    front_end = "OpenGL",
    window_close_confirmation = "NeverPrompt",

    font = wezterm.font_with_fallback({
            { family = "Iosevka", weight = "Medium" },
            "Noto Sans Symbols2",
    }),

    font_shaper = "Harfbuzz",
    bold_brightens_ansi_colors = true,
    font_size = 12.0,
    allow_square_glyphs_to_overflow_width = "WhenFollowedBySpace",
    use_fancy_tab_bar = false,
    -- hide_tab_bar_if_only_one_tab = true,
    tab_bar_at_bottom = true,
    scrollback_lines = 10000,
    check_for_updatess = false,
    show_update_window = false,

    colors = {
        foreground = "#ebdbb2",
        background = "#1d2021",
        cursor_bg = "#ebdbb2",
        cursor_border = "#ebdbb2",
        cursor_fg = "#1d2021",
        selection_bg = "#ebdbb2",
        selection_fg = "#1d2021",

        ansi = {
            "#282828",
            "#cc241d",
            "#98971a",
            "#d79921",
            "#458588",
            "#b16286",
            "#689d6a",
            "#a89984"
        },

        brights = {
            "#928374",
            "#fb4934",
            "#b8bb26",
            "#fabd2f",
            "#83a598",
            "#d3869b",
            "#8ec07c",
            "#ebdbb2"
        },

        tab_bar = {
            background = "#1d2021",

            active_tab = {
                bg_color = "#282828",
                fg_color = "#689d6a",
            },

            inactive_tab = {
                bg_color = "#3c3836",
                fg_color = "#427b58",
            },

            inactive_tab_hover = {
                bg_color = "#504945",
                fg_color = "#427b58",
            },

            new_tab = {
                bg_color = "#282828",
                fg_color = "#458588",
            },

            new_tab_hover = {
                bg_color = "#504945",
                fg_color = "#458588",
            },
        },
    },

    keys = {
        {
            key = "Enter",
            mods = "SHIFT|CTRL",
            action = wezterm.action { SpawnTab = "CurrentPaneDomain" }
        },

        {
            key = "w",
            mods = "SHIFT|CTRL",
            action = wezterm.action { CloseCurrentTab = { confirm = false } },
        },
    },
}
