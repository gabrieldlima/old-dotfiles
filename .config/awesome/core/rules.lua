-- Awesome libs
local awful = require("awful")
local beautiful = require("beautiful")

local screen_width = awful.screen.focused().geometry.width
local screen_height = awful.screen.focused().geometry.height

-------------------------------------------------------------------------------
-- Client rules
-------------------------------------------------------------------------------

awful.rules.rules = {
    ---------------------------------------------------------------------------
    -- All clients will match this rule.
    ---------------------------------------------------------------------------
    { 
        rule = { },
        properties = { 
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            keys = clientkeys,
            buttons = clientbuttons,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap+awful.placement.no_offscreen
        }
    },
    
    ---------------------------------------------------------------------------
    -- Floating clients.
    ---------------------------------------------------------------------------
    {
        rule_any = {
            instance = {
            "DTA",  -- Firefox addon DownThemAll.
            "copyq",  -- Includes session name in class.
            "pinentry",
            },
            class = {
                "Arandr",
                "Blueman-manager",
                "Gpick",
                "Kruler",
                "MessageWin",  -- kalarm.
                "Sxiv",
                "Wpa_gui",
                "veromix",
                "xtightvncviewer"
            },
            name = {
                "Event Tester",  -- xev.
            },
            role = {
                "AlarmWindow",  -- Thunderbird's calendar.
                "ConfigManager",  -- Thunderbird's about:config.
                "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
            }
        },
        properties = { 
            floating = true 
        }
    },
    
    ---------------------------------------------------------------------------
    -- Applications rules
    ---------------------------------------------------------------------------
    -- Lxappearance
    {
        rule_any = {
            class = { "Lxappearance" }
        },
        properties = {
            width = screen_width * 0.50,
            height = screen_height * 0.50,
            floating = true
        }
    },

    -- OpenRGB
    {
        rule_any = {
            class = { "openrgb" }
        },
        properties = {
            width = screen_width * 0.50,
            height = screen_height * 0.50,
            floating = true
        }
    },   

    -- Pavucontrol
    {
        rule_any = {
            class = { "Pavucontrol" }
        },
        properties = {
            width = screen_width * 0.50,
            height = screen_height * 0.50,
            floating = true
        }
    },

    -- Stacer
    {
        rule_any = {
            class = { "stacer" }
        },
        properties = {
            width = screen_width * 0.50,
            height = screen_height * 0.50,
            floating = true
        }
    }
}
