import XMonad

import XMonad.Util.EZConfig
import XMonad.Util.Ungrab

main :: IO ()
main = xmonad $ def
    {
      modMask = mod4Mask -- Rebind Mod to the Super key
    }
  `additionalKeysP`
    [
      ("M-b", spawn "qutebrowser") -- Browser
    , ("M-p", spawn "rofi -show drun") -- Launcher
    , ("M-<Return>", spawn "wezterm") -- Terminal
    ]
