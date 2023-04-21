local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")

-- Applications
terminal = "wezterm"
browser  = "brave-bin"
launcher = "dmenu_run"
editor   = os.getenv("EDITOR") or "nvim"

-- Modkeys
modkey   = "Mod4"
crtlkey  = "Control"
shiftkey = "Shift"

-- Mouse buttons
leftclick     = 1
midclick      = 2
rightclick    = 3
scrolldowm    = 4
scrollup      = 5
sidedownclick = 8
sideupclick   = 9


--------------------
-- Mouse bindings --
--------------------
awful.mouse.append_global_mousebindings({
    awful.button(
        { }, rightclick,
        function () mymainmenu:toggle() end
    ),
    awful.button(
        { }, scrollup,
        awful.tag.viewprev
    ),
    awful.button(
        { }, scrolldowm,
        awful.tag.viewnext
    ),
    awful.button(
        { modkey }, sideupclick,
        awful.tag.viewnext
    ),
    awful.button(
        { modkey }, sidedownclick,
        awful.tag.viewprev
    )
})


------------------
-- Key bindings --
------------------
-- General Awesome keys
awful.keyboard.append_global_keybindings({
    awful.key(
        { modkey }, "s",
        hotkeys_popup.show_help,
        { description="show help", group="awesome" }
    ),
    awful.key(
        { modkey }, "w",
        function () mymainmenu:show() end,
        { description = "show main menu", group = "awesome" }
    ),
    awful.key(
        { modkey, crtlkey }, "r",
        awesome.restart,
        { description = "reload awesome", group = "awesome" }
    ),
    awful.key({ modkey, shiftkey }, "q",
        awesome.quit,
        { description = "quit awesome", group = "awesome" }
    ),
    awful.key(
        { modkey }, "Return",
        function () awful.spawn(terminal) end,
        { description = "open a terminal", group = "launcher" }
    ),
    awful.key(
        { modkey }, "p",
        function() awful.spawn(launcher, false) end,
        { description = "show the dmenu", group = "launcher" }
    ),
    awful.key(
        { modkey }, "x",
        function ()
            awful.prompt.run {
                prompt       = "Run Lua code: ",
                textbox      = awful.screen.focused().mypromptbox.widget,
                exe_callback = awful.util.eval,
                history_path = awful.util.get_cache_dir() .. "/history_eval"
            }
        end,
        { description = "lua execute prompt", group = "awesome" }
    )
})

-- Tags related keybindings
awful.keyboard.append_global_keybindings({
    awful.key(
        { modkey }, "Left",
        awful.tag.viewprev,
        { description = "view previous", group = "tag" }
    ),
    awful.key(
        { modkey }, "Right",
        awful.tag.viewnext,
        { description = "view next", group = "tag" }
    ),
    awful.key(
        { modkey }, "Escape",
        awful.tag.history.restore,
        { description = "go back", group = "tag" }
    ),
})

-- Focus related keybindings
awful.keyboard.append_global_keybindings({
    awful.key(
        { modkey }, "j",
        function () awful.client.focus.byidx( 1) end,
        { description = "focus next by index", group = "client" }
    ),
    awful.key(
        { modkey }, "k",
        function () awful.client.focus.byidx(-1) end,
        { description = "focus previous by index", group = "client" }
    ),
    awful.key(
        { modkey }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
        { description = "go back", group = "client" }
    ),
    awful.key(
        { modkey, crtlkey }, "j",
        function () awful.screen.focus_relative( 1) end,
        { description = "focus the next screen", group = "screen" }
    ),
    awful.key(
        { modkey, crtlkey }, "k",
        function () awful.screen.focus_relative(-1) end,
        { description = "focus the previous screen", group = "screen" }
    ),
    awful.key(
        { modkey, crtlkey }, "n",
        function ()
            local c = awful.client.restore()
            -- Focus restored client
            if c then
                c:activate { raise = true, context = "key.unminimize" }
            end
        end,
        { description = "restore minimized", group = "client" }
    ),
})

-- Layout related keybindings
awful.keyboard.append_global_keybindings({
    awful.key(
        { modkey, shiftkey }, "j",
        function () awful.client.swap.byidx(  1) end,
        { description = "swap with next client by index", group = "client" }
    ),
    awful.key(
        { modkey, shiftkey }, "k",
        function () awful.client.swap.byidx( -1) end,
        { description = "swap with previous client by index", group = "client" }
    ),
    awful.key(
        { modkey }, "u",
        awful.client.urgent.jumpto,
        { description = "jump to urgent client", group = "client" }
    ),
    awful.key(
        { modkey }, "l",
        function () awful.tag.incmwfact( 0.05) end,
        { description = "increase master width factor", group = "layout" }
    ),
    awful.key(
        { modkey }, "h",
        function () awful.tag.incmwfact(-0.05) end,
        { description = "decrease master width factor", group = "layout" }
    ),
    awful.key(
        { modkey, shiftkey }, "h",
        function () awful.tag.incnmaster( 1, nil, true) end,
        { description = "increase the number of master clients", group = "layout" }
    ),
    awful.key(
        { modkey, shiftkey }, "l",
        function () awful.tag.incnmaster(-1, nil, true) end,
        { description = "decrease the number of master clients", group = "layout" }
    ),
    awful.key(
        { modkey, crtlkey }, "h",
        function () awful.tag.incncol( 1, nil, true) end,
        { description = "increase the number of columns", group = "layout" }
    ),
    awful.key(
        { modkey, crtlkey }, "l",
        function () awful.tag.incncol(-1, nil, true) end,
        { description = "decrease the number of columns", group = "layout" }
    ),
    awful.key(
        { modkey }, "space",
        function () awful.layout.inc( 1) end,
        { description = "select next", group = "layout" }
    ),
    awful.key(
        { modkey, shiftkey }, "space",
        function () awful.layout.inc(-1) end,
        { description = "select previous", group = "layout" }
    ),
})

awful.keyboard.append_global_keybindings({
    awful.key {
        modifiers   = { modkey },
        keygroup    = "numrow",
        description = "only view tag",
        group       = "tag",
        on_press    = function (index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                tag:view_only()
            end
        end,
    },
    awful.key {
        modifiers   = { modkey, crtlkey },
        keygroup    = "numrow",
        description = "toggle tag",
        group       = "tag",
        on_press    = function (index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                awful.tag.viewtoggle(tag)
            end
        end,
    },
    awful.key {
        modifiers = { modkey, shiftkey },
        keygroup    = "numrow",
        description = "move focused client to tag",
        group       = "tag",
        on_press    = function (index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:move_to_tag(tag)
                end
            end
        end,
    },
    awful.key {
        modifiers   = { modkey, crtlkey, shiftkey },
        keygroup    = "numrow",
        description = "toggle focused client on tag",
        group       = "tag",
        on_press    = function (index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:toggle_tag(tag)
                end
            end
        end,
    },
    awful.key {
        modifiers   = { modkey },
        keygroup    = "numpad",
        description = "select layout directly",
        group       = "layout",
        on_press    = function (index)
            local t = awful.screen.focused().selected_tag
            if t then
                t.layout = t.layouts[index] or t.layout
            end
        end,
    }
})

client.connect_signal("request::default_mousebindings", function()
    awful.mouse.append_client_mousebindings({
        awful.button(
            { }, leftclick,
            function (c) c:activate { context = "mouse_click" } end
        ),
        awful.button(
            { modkey }, leftclick,
            function (c) c:activate { context = "mouse_click", action = "mouse_move" } end
        ),
        awful.button(
            { modkey }, rightclick,
            function (c) c:activate { context = "mouse_click", action = "mouse_resize" } end
        ),
    })
end)

client.connect_signal("request::default_keybindings", function()
    awful.keyboard.append_client_keybindings({
        awful.key(
            { modkey }, "f",
            function (c)
                c.fullscreen = not c.fullscreen
                c:raise()
            end,
            { description = "toggle fullscreen", group = "client" }
        ),
        awful.key(
            { modkey, shiftkey }, "c",
            function (c) c:kill() end,
            { description = "close", group = "client" }
        ),
        awful.key(
            { modkey, crtlkey }, "space",
            awful.client.floating.toggle,
            { description = "toggle floating", group = "client" }
        ),
        awful.key(
            { modkey, crtlkey }, "Return",
            function (c) c:swap(awful.client.getmaster()) end,
            { description = "move to master", group = "client" }
        ),
        awful.key(
            { modkey }, "o",
            function (c) c:move_to_screen() end,
            { description = "move to screen", group = "client" }
        ),
        awful.key(
            { modkey }, "t",
            function (c) c.ontop = not c.ontop end,
            { description = "toggle keep on top", group = "client" }
        ),
        awful.key(
            { modkey }, "n",
            function (c) c.minimized = true end ,
            { description = "minimize", group = "client" }
        ),
        awful.key(
            { modkey }, "m",
            function (c)
                c.maximized = not c.maximized
                c:raise()
            end ,
            { description = "(un)maximize", group = "client" }
        ),
        awful.key(
            { modkey, crtlkey }, "m",
            function (c)
                c.maximized_vertical = not c.maximized_vertical
                c:raise()
            end ,
            { description = "(un)maximize vertically", group = "client" }
        ),
        awful.key(
            { modkey, shiftkey }, "m",
            function (c)
                c.maximized_horizontal = not c.maximized_horizontal
                c:raise()
            end ,
            { description = "(un)maximize horizontally", group = "client" }
        ),
    })
end)
