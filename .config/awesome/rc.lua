----------------------------------------------------------------------------------------
--  █████╗ ██╗    ██╗███████╗███████╗ ██████╗ ███╗   ███╗███████╗██╗    ██╗███╗   ███╗ --
-- ██╔══██╗██║    ██║██╔════╝██╔════╝██╔═══██╗████╗ ████║██╔════╝██║    ██║████╗ ████║ --
-- ███████║██║ █╗ ██║█████╗  ███████╗██║   ██║██╔████╔██║█████╗  ██║ █╗ ██║██╔████╔██║ --
-- ██╔══██║██║███╗██║██╔══╝  ╚════██║██║   ██║██║╚██╔╝██║██╔══╝  ██║███╗██║██║╚██╔╝██║ --
-- ██║  ██║╚███╔███╔╝███████╗███████║╚██████╔╝██║ ╚═╝ ██║███████╗╚███╔███╔╝██║ ╚═╝ ██║ --
-- ╚═╝  ╚═╝ ╚══╝╚══╝ ╚══════╝╚══════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝ ╚══╝╚══╝ ╚═╝     ╚═╝ --
-----------------------------------------------------------------------------------------

---------------------
-- Awesome modules --
---------------------
require("keyboard")

local awful = require("awful") -- Standard awesome library
require("awful.autofocus")
local wibox = require("wibox") -- Widget and layout library
local beautiful = require("beautiful")-- Theme handling library
local naughty = require("naughty") -- Notification library
local ruled = require("ruled") -- Declarative object management
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys") -- Enable hotkeys help widget for VIM and other apps


--------------------
-- Error handling --
--------------------
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
naughty.connect_signal("request::display_error", function(message, startup)
    naughty.notification {
        urgency = "critical",
        title   = "Oops, an error happened"..(startup and " during startup!" or "!"),
        message = message
    }
end)


--------------------------
-- Variable definitions --
--------------------------
-- Themes define colours, icons, font and wallpapers.
local home = "/home/gabriel/"
beautiful.init(home .. ".config/awesome/theme.lua")


----------
-- Menu --
----------
-- Create a launcher widget and a main menu
myawesomemenu = {
    { "hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
    { "manual", terminal .. " -e man awesome" },
    { "edit config", terminal .. " -e " .. editor .. " " .. awesome.conffile },
    { "restart", awesome.restart },
    { "quit", function() awesome.quit() end },
}

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
    { "open terminal", terminal }
}
})

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it


----------------
-- Tag layout --
----------------
-- Table of layouts to cover with awful.layout.inc, order matters.
tag.connect_signal("request::default_layouts", function()
    awful.layout.append_default_layouts({
        awful.layout.suit.tile,
        awful.layout.suit.floating,
        awful.layout.suit.tile.left,
        awful.layout.suit.tile.bottom,
        awful.layout.suit.tile.top,
        awful.layout.suit.fair,
        awful.layout.suit.fair.horizontal,
        awful.layout.suit.spiral,
        awful.layout.suit.spiral.dwindle,
        awful.layout.suit.max,
        awful.layout.suit.max.fullscreen,
        awful.layout.suit.magnifier,
        awful.layout.suit.corner.nw,
    })
end)


-----------
-- Wibar --
-----------
screen.connect_signal("request::desktop_decoration", function(s)
    -- Each screen has its own tag table.
    awful.tag({ "󰬺", "󰬻", "󰬼", "󰬽", "󰬾", "󰬿", "󰭀", "󰭁", "󰭂" }, s, awful.layout.layouts[1])

    -- Create a taglist widget
    s.taglist_widget = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = {
            awful.button(
                { }, leftclick,
                function(t) t:view_only() end
            ),
            awful.button(
                { modkey }, leftclick,
                function(t)
                    if client.focus then
                        client.focus:move_to_tag(t)
                    end
                end
            ),
            awful.button(
                { }, rightclick,
                awful.tag.viewtoggle
            ),
            awful.button(
                { modkey }, rightclick,
                function(t)
                    if client.focus then
                        client.focus:toggle_tag(t)
                    end
                end
            ),
            awful.button(
                { }, scrollup,
                function(t) awful.tag.viewprev(t.screen) end
            ),
            awful.button(
                { }, scrolldowm,
                function(t) awful.tag.viewnext(t.screen) end
            ),
        }
    }

    -- Create a tasklist widget
    s.tasklist_widget = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.focused,
    }

    -- Create a textclock widget
    s.textclock_widget = wibox.widget {
        format = "%a %b %d %I:%M %p ",
        widget = wibox.widget.textclock
    }

    -- Create a layoutbox widget
    s.layoutbox_widget = awful.widget.layoutbox {
        screen  = s,
        buttons = {
            awful.button(
                { }, leftclick,
                function () awful.layout.inc( 1) end
            ),
            awful.button(
                { }, rightclick,
                function () awful.layout.inc(-1) end
            ),
        }
    }

    -- Create the wibox
    s.wibox = awful.wibar {
        position = "top",
        screen   = s,
        widget   = {
            layout = wibox.layout.align.horizontal,
            { -- Left widgets
                layout = wibox.layout.fixed.horizontal,
                s.taglist_widget,
            },
            s.tasklist_widget, -- Middle widget
            { -- Right widgets
                layout = wibox.layout.fixed.horizontal,
                wibox.widget.systray(),
                s.textclock_widget,
                s.layoutbox_widget,
            },
        }
    }
end)


-----------
-- Rules --
-----------
-- Rules to apply to new clients.
ruled.client.connect_signal("request::rules", function()
    -- All clients will match this rule.
    ruled.client.append_rule {
        id         = "global",
        rule       = { },
        properties = {
            focus     = awful.client.focus.filter,
            raise     = true,
            screen    = awful.screen.preferred,
            placement = awful.placement.no_overlap+awful.placement.no_offscreen
        }
    }

    -- Floating clients.
    ruled.client.append_rule {
        id       = "floating",
        rule_any = {
            instance = { "copyq", "pinentry" },
            class    = {
                "Arandr", "Blueman-manager", "Gpick", "Kruler", "Sxiv",
                "Tor Browser", "Wpa_gui", "veromix", "xtightvncviewer"
            },
            -- Note that the name property shown in xprop might be set slightly after creation of the client
            -- and the name shown there might not match defined rules here.
            name    = {
                "Event Tester",  -- xev.
            },
            role    = {
                "AlarmWindow",    -- Thunderbird's calendar.
                "ConfigManager",  -- Thunderbird's about:config.
                "pop-up",         -- e.g. Google Chrome's (detached) Developer Tools.
            }
        },
        properties = { floating = true }
    }

    -- Set Firefox to always map on the tag named "2" on screen 1.
    -- ruled.client.append_rule {
    --     rule       = { class = "Firefox"     },
    --     properties = { screen = 1, tag = "2" }
    -- }
end)

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:activate { context = "mouse_enter", raise = false }
end)


-------------------
-- Notifications --
-------------------
ruled.notification.connect_signal('request::rules', function()
    -- All notifications will match this rule.
    ruled.notification.append_rule {
        rule       = { },
        properties = {
            screen           = awful.screen.preferred,
            implicit_timeout = 5,
        }
    }
end)

naughty.connect_signal("request::display", function(n)
    naughty.layout.box { notification = n }
end)


---------------
-- Wallpaper --
---------------
awful.spawn("xwallpaper --stretch Pictures/Wallpapers/wallpaper.jpg", false)