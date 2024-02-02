-- ╔══════════════════════════════════════════════════════╗
-- ║██╗  ██╗███╗   ███╗ ██████╗ ███╗   ██╗ █████╗ ██████╗ ║
-- ║╚██╗██╔╝████╗ ████║██╔═══██╗████╗  ██║██╔══██╗██╔══██╗║
-- ║ ╚███╔╝ ██╔████╔██║██║   ██║██╔██╗ ██║███████║██║  ██║║
-- ║ ██╔██╗ ██║╚██╔╝██║██║   ██║██║╚██╗██║██╔══██║██║  ██║║
-- ║██╔╝ ██╗██║ ╚═╝ ██║╚██████╔╝██║ ╚████║██║  ██║██████╔╝║
-- ║╚═╝  ╚═╝╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═╝╚═════╝ ║
-- ╚══════════════════════════════════════════════════════╝


--
-- Useful imports
--
-- Core
import XMonad

-- Hooks
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.ManageHook

-- Layouts
import XMonad.Layout.Fullscreen
import XMonad.Layout.Gaps
import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing

-- Utils
import XMonad.Util.EZConfig
import XMonad.Util.SpawnOnce
import XMonad.Util.Ungrab


-------------------------------------------------------------------------------
-- The default number of workspaces (virtual screens) and their names.
-- By default we use numeric strings, but any string may be used as a
-- workspace name. The number of workspaces is determined by the length
-- of this list.
--
-- A tagging example:
--
-- > workspaces = ["web", "irc", "code" ] ++ map show [4..9]
--
workspaces :: [WorkspaceId]
workspaces = map show [1 .. 9 :: Int]

-- modMask lets you specify which modkey you want to use. The default
-- is mod1Mask ("left alt").  You may also consider using mod3Mask
-- ("right alt"), which does not conflict with emacs keybindings. The
-- "windows key" is usually mod4Mask.
--
myModMask :: KeyMask
myModMask = mod4Mask

-- Width of the window border in pixels.
--
myBorderWidth :: Dimension
myBorderWidth = 1

-- Border colors for unfocused and focused windows, respectively.
--
myNormalBorderColor, myFocusedBorderColor :: String
myNormalBorderColor  = "#050508"
myFocusedBorderColor = "#b4befe"

-- Whether focus follows the mouse pointer.
--
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

-- Whether a mouse click select the focus or is just passed to the window
--
myClickJustFocuses :: Bool
myClickJustFocuses = True


-------------------------------------------------------------------------------
-- Window rules

-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
--  xprop | grep WM_CLASS
-- and click on the client you're interested in.
myManageHook :: ManageHook
myManageHook = fullscreenManageHook <+> manageDocks <+> composeAll
    [
      isDialog --> doFloat
    ]


-------------------------------------------------------------------------------
-- Key bindings:

myTerminal :: String
myTerminal = "wezterm"

myBrowser :: String
myBrowser = "brave"

myLauncher :: String
myLauncher = "rofi -show drun"

myScreenshot :: String
myScreenshot = "scrot -s"

myKeys =
    [
      ("M-b",        spawn myBrowser)    -- Launch browser
    , ("M-p",        spawn myLauncher)   -- Launch rofi launcher
    , ("M-<Return>", spawn myTerminal)   -- Launch terminal
    , ("M-C-s",      spawn myScreenshot) -- Launch scrot

    -- reset gaps
    , (("M-g"), sendMessage $ setGaps [(L,0), (R,0), (U,0), (D,0)])
    -- increment gaps
    , (("M-C-g"), sequence_ [sendMessage $ IncGap 25 L, sendMessage $ IncGap 25 U, sendMessage $ IncGap 25 D, sendMessage $ IncGap 25 R])
    -- decrement gaps
    , (("M-S-g"), sequence_ [sendMessage $ DecGap 25 L, sendMessage $ DecGap 25 U, sendMessage $ DecGap 25 D, sendMessage $ DecGap 25 R])
    ]


-------------------------------------------------------------------------------
-- Startup hook:

-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.
myStartupHook :: X ()
myStartupHook = do
    spawnOnce "picom"                          -- Compositor
    spawnOnce "nitrogen --restore"             -- Set a nice wallpaper
    spawnOnce "xsetroot -cursor_name left_ptr" -- Set the default X cursor to the usual pointer
    spawnOnce "xset s off -dpms"               -- Disable screen saver
    spawnOnce "openrgb -d 0 -m off"            -- Turn off DIMM01 RGB leds
    spawnOnce "openrgb -d 1 -m off"            -- Turn off DIMM02 RGB leds


-------------------------------------------------------------------------------
-- Layouts
--
-- You can specify and transform your layouts by modifying these values.
-- If you change layout bindings be sure to use 'mod-shift-space' after
-- restarting (with 'mod-q') to reset your layout state to the new
-- defaults, as xmonad preserves your old layout settings by default.
--

-- The available layouts.  Note that each layout is separated by |||, which
-- denotes layout choice.
myLayoutHook = avoidStruts
             $ gaps [(L,0), (R,0), (U,0), (D,0)]
             $ spacingRaw False (Border 5 5 5 5) True (Border 5 5 5 5) True
             $ smartBorders
             $ tiled ||| Mirror tiled ||| Full
  where
    -- default tiling algorithm partitions the screen into two panes
    tiled   = Tall nmaster delta ratio

    -- Default number of windows in the master pane
    nmaster = 1

    -- Default proportion of screen occupied by master pane
    ratio   = 1/2

    -- Percent of screen to increment by when resizing panes
    delta   = 3/100


-------------------------------------------------------------------------------
-- Run xmonad with all the defaults we set up:

-- A structure containing your configuration settings, overriding
-- fields in the default config. Any you don't override, will
-- use the defaults defined in xmonad/XMonad/Config.hs
--
-- No need to modify this.
--
myConfig = def
    {
      modMask            = myModMask
    , layoutHook         = myLayoutHook
    , startupHook        = myStartupHook
    , manageHook         = myManageHook
    , borderWidth        = myBorderWidth
    , normalBorderColor  = myNormalBorderColor
    , focusedBorderColor = myFocusedBorderColor
    , focusFollowsMouse  = myFocusFollowsMouse
    , clickJustFocuses   = myClickJustFocuses
    }
  `additionalKeysP` myKeys

main :: IO ()
main = xmonad
     . fullscreenSupport
     . docks
     . ewmhFullscreen
     . ewmh
     $ myConfig
