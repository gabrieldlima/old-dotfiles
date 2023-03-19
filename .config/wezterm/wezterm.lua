local wezterm = require("wezterm")

local custom = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]
custom.background = "#11111b"

return {
    color_schemes = {
        ["Catppuccin_Mocha"] = custom,
    },
    color_scheme = "Catppuccin_Mocha",
}
