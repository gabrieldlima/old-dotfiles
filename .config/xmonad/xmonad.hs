-- ╔══════════════════════════════════════════════════════╗
-- ║██╗  ██╗███╗   ███╗ ██████╗ ███╗   ██╗ █████╗ ██████╗ ║
-- ║╚██╗██╔╝████╗ ████║██╔═══██╗████╗  ██║██╔══██╗██╔══██╗║
-- ║ ╚███╔╝ ██╔████╔██║██║   ██║██╔██╗ ██║███████║██║  ██║║
-- ║ ██╔██╗ ██║╚██╔╝██║██║   ██║██║╚██╗██║██╔══██║██║  ██║║
-- ║██╔╝ ██╗██║ ╚═╝ ██║╚██████╔╝██║ ╚████║██║  ██║██████╔╝║
-- ║╚═╝  ╚═╝╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═╝╚═════╝ ║
-- ╚══════════════════════════════════════════════════════╝

import XMonad                     -- Core XMonad module

import XMonad.Util.EZConfig       -- Utility for easily configuring keybindings
import XMonad.Util.Ungrab         -- Handles releasing keyboard and pointer grabs
import XMonad.Util.SpawnOnce      -- For spawning applications just once during XMonad startup
import XMonad.Layout.ThreeColumns -- Layout for arranging windows in three columns
import XMonad.Hooks.EwmhDesktops  -- Enhances XMonad's handling of EWMH hints and full-screen support
import XMonad.Hooks.ManageHelpers -- Used for defining rules to manage how windows are handled
import XMonad.Hooks.ManageDocks   -- Provides tools to automatically manage dock type programs

main :: IO ()
main = xmonad $ ewmhFullscreen $ ewmh $ docks $ myConfig

myConfig = def
    {
      modMask = mod4Mask          -- Rebind Mod to the Super key
    , layoutHook = myLayout       -- Use custom layouts
    , startupHook = myStartupHook -- Autostart applications
    , manageHook = myManageHook   -- Match on certain windows
    }
  `additionalKeysP`
    [
      ("M-b", spawn "qutebrowser")     -- Browser
    , ("M-p", spawn "rofi -show drun") -- Launcher
    , ("M-<Return>", spawn "wezterm")  -- Terminal
    ]

myLayout = avoidStruts $ tiled ||| Mirror tiled ||| threeCol ||| Full
  where
    threeCol = ThreeColMid nmaster delta ratio
    tiled = Tall nmaster delta ratio
    nmaster = 1     -- Default number of windows in the master pane
    ratio = 1/2     -- Default proportion of screen occupied by master pane
    delta = 3/100   -- Percent of screen to increment by when resizing panes

myStartupHook :: X ()
myStartupHook = do
  spawnOnce "picom"                          -- Compositor
  spawnOnce "nitrogen --restore"             -- Wallpaper
  spawnOnce "xsetroot -cursor_name left_ptr" -- Set the mouse cursor

myManageHook :: ManageHook
myManageHook = composeAll
    [
      isDialog --> doFloat -- Float all dialog windows
    ]