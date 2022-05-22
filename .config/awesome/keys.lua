-- Awesome libs
local awful = require("awful")
local gears = require("gears")
local naughty = require("naughty")
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup")
local dpi = beautiful.xresources.apply_dpi
require("awful.hotkeys_popup.keys")

-- Define default applications
terminal = "kitty"
editor = os.getenv("nvim") or "nvim"
editor_cmd = terminal .. " -e " .. editor
launcher = "/home/gabriel/.config/rofi/scripts/launcher.sh"

-- Define modkeys
local modkey   = "Mod4"
local altkey   = "Mod1"
local ctrlkey  = "Control"
local shiftkey = "Shift"

-- Define mouse button
local leftclick     = 1
local midclick      = 2
local rightclick    = 3
local scrolldown    = 4
local scrollup      = 5
local sidedownclick = 8
local sideupclick   = 9

-------------------------------------------------------------------------------
-- Movement functions
-------------------------------------------------------------------------------

-- Move local client
local function move_client (c, direction)
    -- If client is floating, move to edge
    if c.floating or (awful.layout.get(mouse.screen) == awful.layout.suit.floating) then
        local workarea = awful.screen.focused().workarea
        if direction == "up" then
            c:geometry({
                nil,
                y = workarea.y + beautiful.useless_gap * 2,
                nil,
                nil
            })
        elseif direction == "down" then
            c:geometry({
                nil,
                y = workarea.height + workarea.y - c:geometry().height - beautiful.useless_gap * 2 - beautiful.border_width * 2,
                nil,
                nil
            })
        elseif direction == "left" then
            c:geometry({
                x = workarea.x + beautiful.useless_gap * 2,
                nil,
                nil,
                nil
            })
        elseif direction == "right" then
            c:geometry({
                x = workarea.width + workarea.x - c:geometry().width - beautiful.useless_gap * 2 - beautiful.border_width * 2,
                nil,
                nil,
                nil
            })
        end
    -- If maxed layout then swap windows
    elseif awful.layout.get(mouse.screen) == awful.layout.suit.max then
        if direction == "up" or direction == "left" then
            awful.client.swap.byidx(-1, c)
        elseif direction == "down" or direction == "right" then
            awful.client.swap.byidx(1, c)
        end
    -- Otherwise swap the client in the tiled layout
    else
        awful.client.swap.bydirection(direction, c, nil)
    end
end

-- Resize local client
local floating_resize_amount = dpi(20)
local tiling_resize_factor = 0.05

local function resize_client (c, direction)
    if awful.layout.get(mouse.screen) == awful.layout.suit.floating or (c and c.floating) then
        if direction == "up" then
            c:relative_move(0, 0, 0, -floating_resize_amount)
        elseif direction == "down" then
            c:relative_move(0, 0, 0, floating_resize_amount)
        elseif direction == "left" then
            c:relative_move(0, 0, -floating_resize_amount, 0)
        elseif direction == "right" then
            c:relative_move(0, 0, floating_resize_amount, 0)
        end
    else
        if direction == "up" then
            awful.client.incwfact(-tiling_resize_factor)
        elseif direction == "down" then
            awful.client.incwfact(tiling_resize_factor)
        elseif direction == "left" then
            awful.tag.incmwfact(-tiling_resize_factor)
        elseif direction == "right" then
            awful.tag.incmwfact(tiling_resize_factor)
        end
    end
end

-- Raise focus client
local function raise_client ()
    if client.focus then
        client.focus:raise()
    end
end

-------------------------------------------------------------------------------
-- Mouse bindings
-------------------------------------------------------------------------------

clientbuttons = gears.table.join(
    awful.button(
        { }, leftclick, 
        function (c) 
            c:emit_signal("request::activate", "mouse_click", {raise = true})
        end
    ),
    awful.button(
        { modkey }, leftclick, 
        function (c)
            c:emit_signal("request::activate", "mouse_click", {raise = true})
            awful.mouse.client.move(c)
        end
    ),
    awful.button(
        { modkey }, rightclick,
        function (c)
            c:emit_signal("request::activate", "mouse_click", {raise = true})
            awful.mouse.client.resize(c)
        end
    )
)

-------------------------------------------------------------------------------
-- Client Keybindings
-------------------------------------------------------------------------------

clientkeys = gears.table.join(
    ---------------------------------------------------------------------------
    -- Client moves
    ---------------------------------------------------------------------------
    awful.key(
        { modkey, shiftkey }, "j", 
        function (c) move_client(c, "down") end,
        { description = "move down", group = "client" }
    ),
    awful.key(
        { modkey, shiftkey }, "k", 
        function (c) move_client(c, "up") end,
        { description = "move up", group = "client" }
    ),
    awful.key(
        { modkey, shiftkey }, "h",
        function (c) move_client(c, "left") end,
        { description = "move left", group = "client" }
    ),
    awful.key(
        { modkey, shiftkey }, "l",     
        function (c) move_client(c, "right") end,
        { description = "move right", group = "client" }
    ),
 
    ---------------------------------------------------------------------------
    -- Client control
    ---------------------------------------------------------------------------
    awful.key(
        { modkey, shiftkey }, "c",
        function (c) c:kill() end,
        { description = "close", group = "client" }
    ),
    awful.key(
        { modkey, ctrlkey }, "space", 
        awful.client.floating.toggle,
        { description = "toggle floating", group = "client" }
    ),
    awful.key(
        { modkey, ctrlkey }, "Return", 
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
        { modkey }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end,
        { description = "toggle fullscreen", group = "client" }
    )
)

-------------------------------------------------------------------------------
-- Global Keybindings
-------------------------------------------------------------------------------

globalkeys = gears.table.join(
    ---------------------------------------------------------------------------
    -- Awesome general
    ---------------------------------------------------------------------------
    awful.key(
        { modkey }, "s",      
        hotkeys_popup.show_help,
        { description="show help", group="awesome" }
    ),
    awful.key(
        { modkey, ctrlkey }, "r", 
        awesome.restart,
        { description = "reload awesome", group = "awesome" }
    ),
    awful.key(
        { modkey, shiftkey }, "q", 
        awesome.quit,
        { description = "quit awesome", group = "awesome" }
    ),

    ---------------------------------------------------------------------------
    -- Screen focus
    ---------------------------------------------------------------------------
    awful.key(
        { modkey, ctrlkey }, "s", 
        function () awful.screen.focus_relative(1) end,
        { description = "focus the next screen", group = "screen" }
    ),
    awful.key(
        { modkey, ctrlkey }, "S", 
        function () awful.screen.focus_relative(-1) end,
        { description = "focus the previous screen", group = "screen" }
    ),

    ---------------------------------------------------------------------------
    -- Client focus
    ---------------------------------------------------------------------------
    awful.key(
        { modkey }, "j",
        function ()
            awful.client.focus.bydirection("down")
            raise_client()
        end,
        { description = "focus down", group = "client" }
    ),
    awful.key(
        { modkey }, "k",
        function ()
            awful.client.focus.bydirection("up")
            raise_client()
        end,
        { description = "focus up", group = "client" }
    ),
    awful.key(
        { modkey }, "h",
        function ()
            awful.client.focus.bydirection("left")
            raise_client()
        end,
        { description = "focus left", group = "client" }
    ),
    awful.key(
        { modkey }, "l",
        function ()
            awful.client.focus.bydirection("right")
            raise_client()
        end,
        { description = "focus right", group = "client" }
    ),

    ---------------------------------------------------------------------------
    -- Client resize
    ---------------------------------------------------------------------------
    awful.key(
        { modkey, ctrlkey }, "j",     
        function () resize_client(client.focus, "down") end,
        { description = "resize down", group = "client" }
    ),
    awful.key(
        { modkey, ctrlkey }, "k",     
        function () resize_client(client.focus, "up") end,
        { description = "resize up", group = "client" }
    ),
    awful.key(
        { modkey, ctrlkey }, "h",     
        function () resize_client(client.focus, "left") end,
        { description = "resize left", group = "client" }
    ),
    awful.key(
        { modkey, ctrlkey }, "l",     
        function () resize_client(client.focus, "right") end,
        { description = "resize right", group = "client" }
    ),


    ---------------------------------------------------------------------------
    -- Layout selection
    ---------------------------------------------------------------------------
    awful.key(
        { modkey }, "space", 
        function () awful.layout.inc(1) end,
        { description = "select next", group = "layout" }
    ),
    awful.key(
        { modkey, shiftkey }, "space", 
        function () awful.layout.inc(-1) end,
        { description = "select previous", group = "layout" }
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

    ---------------------------------------------------------------------------
    -- Applications
    ---------------------------------------------------------------------------
    awful.key(
        { modkey }, "Return", 
        function () awful.spawn(terminal) end,
        { description = "open a terminal", group = "launcher" }
    ),
    awful.key(
        { modkey }, "r",     
        --function () awful.screen.focused().mypromptbox:run() end,
        function () awful.spawn(launcher) end,
        { description = "run prompt", group = "launcher" }
    ),

    awful.key(
        { modkey, ctrlkey }, "n",
        function ()
            local c = awful.client.restore()
            -- Focus restored client
            if c then
                c:emit_signal("request::activate", "key.unminimize", {raise = true})
            end
        end,
        { description = "restore minimized", group = "client" }
    )
)

-- Bind all key numbers to tags.
for i = 1, 9 do
    globalkeys = gears.table.join(
        globalkeys,
        -- View tag only.
        awful.key(
            { modkey }, "#" .. i + 9,
            function ()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    tag:view_only()
                end
            end,
            { description = "view tag #"..i, group = "tag" }
        ),
        -- Toggle tag display.
        awful.key(
            { modkey, ctrlkey }, "#" .. i + 9,
            function ()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    awful.tag.viewtoggle(tag)
                end
            end,
            { description = "toggle tag #" .. i, group = "tag" }
        ),
        -- Move client to tag.
        awful.key(
            { modkey, shiftkey }, "#" .. i + 9,
            function ()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:move_to_tag(tag)
                    end
                end
            end,
            { description = "move focused client to tag #"..i, group = "tag" } 
        ),
        -- Toggle tag on focused client.
        awful.key(
            { modkey, ctrlkey, shiftkey }, "#" .. i + 9,
            function ()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:toggle_tag(tag)
                    end
                end
            end,
            { description = "toggle focused client on tag #" .. i, group = "tag" }
        )
    )
end

root.keys(globalkeys)
