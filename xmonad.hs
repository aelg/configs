import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Hooks.SetWMName
import XMonad.Layout.NoBorders
import System.IO

myFocusedBorderColor = "#ff0000"
myNormalBorderColor = "#303030"

myManageHook = composeAll
    [ className =? "Gimp"      --> doFloat
    , className =? "Vncviewer" --> doFloat
    ]
 
main = do
    xmproc <- spawnPipe "/usr/bin/xmobar /home/aelg/.xmobarrc"
    xmonad $ defaultConfig
        { startupHook = startup
        , manageHook = manageDocks <+> (isFullscreen --> doFullFloat)  <+> myManageHook -- make sure to include myManageHook definition from above
                        <+> manageHook defaultConfig
        , layoutHook = lessBorders OnlyFloat $ avoidStruts  $  layoutHook defaultConfig
        , logHook = dynamicLogWithPP xmobarPP
                        { ppOutput = hPutStrLn xmproc
                        , ppTitle = xmobarColor "green" "" . shorten 50
                        }
        , focusedBorderColor = myFocusedBorderColor
        , normalBorderColor = myNormalBorderColor
        , modMask = mod4Mask     -- Rebind Mod to the Windows key
        } `additionalKeys`  -- http://xmonad.org/xmonad-docs/X11/src/Graphics-X11-Types.html
        [ ((mod4Mask .|. shiftMask, xK_z), spawn "slock")
        , ((mod1Mask .|. shiftMask, xK_1), spawn "chromium")

        , ((mod1Mask .|. shiftMask, xK_s), spawn "setxkbmap se && xmodmap /home/aelg/.Xmodmap")
        , ((mod1Mask .|. shiftMask, xK_a), spawn "setxkbmap us altgr-intl && xmodmap /home/aelg/.Xmodmap")
        
        , ((mod1Mask .|. shiftMask, xK_comma), spawn "/home/aelg/bin/pactl-default-sink set-sink-volume -1dB")
        , ((mod1Mask .|. shiftMask, xK_period), spawn "/home/aelg/bin/pactl-default-sink set-sink-volume +1dB")
        , ((mod1Mask .|. shiftMask, xK_slash), spawn "/home/aelg/bin/pactl-default-sink set-sink-mute toggle")
        , ((mod1Mask .|. shiftMask, xK_q), spawn "/home/aelg/bin/switch-sink")

        , ((0                     , 0x1008FF02), spawn "xbacklight + 5")
        , ((0                     , 0x1008FF03), spawn "xbacklight - 5")

        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((0, xK_Print), spawn "scrot '%Y-%m-%d-%H:%M:%S.png' -e 'mv $f /home/aelg/shots'")
        ]

startup :: X ()
startup = do
    setWMName "LG3D"
    spawn "/home/aelg/bin/restarttrayer"

