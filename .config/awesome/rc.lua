-- ----------------------------------------------------------------------------------------
--  █████╗ ██╗    ██╗███████╗███████╗ ██████╗ ███╗   ███╗███████╗██╗    ██╗███╗   ███╗ --
-- ██╔══██╗██║    ██║██╔════╝██╔════╝██╔═══██╗████╗ ████║██╔════╝██║    ██║████╗ ████║ --
-- ███████║██║ █╗ ██║█████╗  ███████╗██║   ██║██╔████╔██║█████╗  ██║ █╗ ██║██╔████╔██║ --
-- ██╔══██║██║███╗██║██╔══╝  ╚════██║██║   ██║██║╚██╔╝██║██╔══╝  ██║███╗██║██║╚██╔╝██║ --
-- ██║  ██║╚███╔███╔╝███████╗███████║╚██████╔╝██║ ╚═╝ ██║███████╗╚███╔███╔╝██║ ╚═╝ ██║ --
-- ╚═╝  ╚═╝ ╚══╝╚══╝ ╚══════╝╚══════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝ ╚══╝╚══╝ ╚═╝     ╚═╝ --
-----------------------------------------------------------------------------------------

-- Load luarocks if installed
pcall(require, "luarocks.loader")

--
-- [[ Awesome modules ]]
--
require("themes")
require("bindings")
require("rules")
require("signals")
require("ui")
require("awful.autofocus")
require("awful.hotkeys_popup.keys")

-- Autostart script
require("awful").spawn.with_shell(os.getenv("HOME") .. "/.config/awesome/config/autostart.sh")
require("awful").spawn("openrgb -d 0 -m static -c 0000FF", false)
require("awful").spawn("openrgb -d 1 -m static -c 0000FF", false)

-- Garbage collection
require("gears").timer {
  timeout = 5,
  autostart = true,
  call_now = true,
  callback = function()
    collectgarbage "collect"
  end,
}

collectgarbage("setpause", 110)
collectgarbage("setstepmul", 1000)
