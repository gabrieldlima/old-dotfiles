local wezterm = require("wezterm")

local custom = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]
custom.background = "#11111b"

return {
    -- Configuration
    check_for_updates = false,
    enable_tab_bar = true,
    hide_tab_bar_if_only_one_tab = true,
    window_close_confirmation = 'NeverPrompt',
    initial_cols = 120,
    initial_rows = 30,

    -- Fonts
    font = wezterm.font 'Fira Code',
    font_size = 10.0,

    -- Colors & Appearance
    color_schemes = {
        ["Catppuccin_Mocha"] = custom,
    },
    color_scheme = "Catppuccin_Mocha",
}
