local wezterm = require("wezterm")
local act = wezterm.action

local custom = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]
custom.background = "#11111b"

return {
    -- Configuration
    check_for_updates = false,
    enable_tab_bar = true,
    hide_tab_bar_if_only_one_tab = true,
    window_close_confirmation = "NeverPrompt",
    initial_cols = 120,
    initial_rows = 30,

    -- Key Binding
    disable_default_key_bindings = true,
    leader = { key = 'a', mods = "CTRL", timeout_milliseconds = 1000 },
    keys = {
        { key = 'f', mods = "LEADER", action = act.ToggleFullScreen },
        { key = 'l', mods = "ALT", action = act.ShowLauncher },
        { key = 'L', mods = "CTRL|SHIFT", action = act.ShowDebugOverlay },

        -- Tabs
        { key = 't', mods = "LEADER", action = act.SpawnTab "CurrentPaneDomain" },
        { key = 'F9', mods = 'ALT', action = act.ShowTabNavigator },

        -- Panels
        { key = '=', mods = 'LEADER', action = act.PaneSelect },
        { key = '\\', mods = "LEADER", action = act.SplitHorizontal { domain = "CurrentPaneDomain" } },
        { key = '-', mods = "LEADER", action = act.SplitVertical { domain = "CurrentPaneDomain" } },
        { key = 'h', mods = "LEADER", action = act.ActivatePaneDirection "Left" },
        { key = 'j', mods = "LEADER", action = act.ActivatePaneDirection "Down" },
        { key = 'k', mods = "LEADER", action = act.ActivatePaneDirection "Up" },
        { key = 'l', mods = "LEADER", action = act.ActivatePaneDirection "Right" },
        { key = 'H', mods = "LEADER", action = act.AdjustPaneSize { "Left", 5} },
        { key = 'J', mods = "LEADER", action = act.AdjustPaneSize { "Down", 5} },
        { key = 'K', mods = "LEADER", action = act.AdjustPaneSize { "Up", 5} },
        { key = 'L', mods = "LEADER", action = act.AdjustPaneSize { "Right", 5} },

        -- Copy and Paste
        { key = 'c', mods = "SHIFT|CTRL", action = act.Copy },
        { key = 'v', mods = "SHIFT|CTRL", action = act.Paste }
    },

    -- Fonts
    font = wezterm.font "Fira Code",
    font_size = 10.0,

    -- Colors & Appearance
    color_schemes = {
        ["Catppuccin_Mocha"] = custom,
    },
    color_scheme = "Catppuccin_Mocha",
}
