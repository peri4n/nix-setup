{-# LANGUAGE TupleSections #-}

import Data.List (isPrefixOf)
import Data.Map as M
import Data.Time

import Graphics.X11.ExtraTypes.XF86

import System.Exit

import XMonad
import XMonad.Actions.Minimize
import XMonad.Actions.WindowBringer
import XMonad.Actions.WindowGo
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops (ewmh)
import XMonad.Hooks.ManageDocks       ( avoidStruts )
import XMonad.Hooks.ManageDocks (avoidStruts, docks)
import XMonad.Hooks.Minimize
import XMonad.Hooks.SetWMName
import XMonad.Hooks.UrgencyHook
import XMonad.Layout.BoringWindows    ( boringWindows )
import XMonad.Layout.Minimize         ( minimize )
import XMonad.Layout.NoBorders
import XMonad.Layout.Renamed          ( Rename(..) , renamed)
import XMonad.Prompt
import XMonad.Prompt.FuzzyMatch
import XMonad.Util.NamedScratchpad
import XMonad.Util.Run
import qualified XMonad.Layout.BoringWindows   as B
import qualified XMonad.StackSet               as W

main :: IO ()
main = do
  config <-(docks <$> statusBar myBar myXmobarPP toggleStrutsKey myConfig)
  dirs <- getDirectories
  launch config dirs

myConfig =
  ewmh
    ( withUrgencyHook NoUrgencyHook $
        def
          { modMask = mod4Mask,
            startupHook = setWMName "LG3D",
            borderWidth = 1,
            terminal = "kitty",
            normalBorderColor = "darkgrey",
            focusedBorderColor = "white",
            XMonad.keys = myKeys,
            focusFollowsMouse = myFocusFollowsMouse,
            clickJustFocuses = myClickJustFocuses,
            workspaces = myWorkspaces,
            handleEventHook = myEventHooks,
            manageHook = myManageHook <+> manageHook def,
            layoutHook = avoidStruts myLayout
          }
    )

-- Key binding to toggle the gap for the bar.
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

-- Click is passed through when clicked on an inactive window
myClickJustFocuses = False

-- It should only be possible to switch focus via keyboard
myFocusFollowsMouse = False

myWorkspaces :: [String]
myWorkspaces = ["Web", "Dev", "Chat", "Mail"]

-- Key binding to toggle the gap for the bar.
myToggleStrutsKey :: XConfig Layout -> (KeyMask, KeySym)
myToggleStrutsKey XConfig { XMonad.modMask = modMask } = (modMask, xK_b)

---------------------------------------
-- DOCKS
---------------------------------------

-- Command to launch the bar.
myBar :: String
myBar = "xmobar"

-- Custom PP, configure it as you like. It determines what is being written to the bar.
myXmobarPP :: PP
myXmobarPP = xmobarPP { ppTitle   = xmobarColor "white" "" . shorten 150
                , ppCurrent = xmobarColor "#bd93f9" "" . wrap " " " "
                , ppUrgent  = xmobarColor "yellow" "" . xmobarStrip
                , ppLayout  = xmobarColor "#bd93f9" ""
                }

---------------------------------------
-- EVENT HOOKS
---------------------------------------

myEventHooks = handleEventHook def <+> minimizeEventHook

---------------------------------------
-- KEYS
---------------------------------------

bringerConfig :: WindowBringerConfig
bringerConfig = def { menuArgs = ["-i", "-l", "10"] }

myKeys :: XConfig Layout -> M.Map (KeyMask, KeySym) (X ())
myKeys conf@XConfig { XMonad.modMask = modMask } =
        M.fromList $
    -- launching and killing programs
          [ ((modMask              , xK_Return), spawn $ XMonad.terminal conf)
          , ((modMask              , xK_n), spawn "rofi -show run")
          , ((modMask              , xK_f), spawn "autorandr --list | dmenu | xargs autorandr --load")
          , ((modMask .|. shiftMask, xK_Escape), spawn "slock")
          , ((modMask .|. shiftMask, xK_c), kill)

    -- window switcher
          , ((modMask              , xK_e), bringMenuConfig bringerConfig)
          , ((modMask .|. shiftMask, xK_e), gotoMenuConfig bringerConfig)

    -- switch layouts
          , ((modMask              , xK_space), sendMessage NextLayout)
          , ((modMask .|. shiftMask, xK_space), setLayout $ XMonad.layoutHook conf)

    -- move focus up or down the window stack
          , ((modMask              , xK_Tab), B.focusDown)
          , ((modMask .|. shiftMask, xK_Tab), B.focusUp)
          , ((modMask              , xK_m), withFocused minimizeWindow)
          , ((modMask .|. shiftMask, xK_m), withLastMinimized maximizeWindowAndFocus)

    -- modifying the window order
          , ((modMask .|. shiftMask, xK_Return), windows W.swapMaster)
          , ((modMask .|. shiftMask, xK_j), windows W.swapDown)
          , ((modMask .|. shiftMask, xK_k) , windows W.swapUp)

    -- resizing the master/slave ratio
          , ((modMask, xK_h), sendMessage Shrink)
          , ((modMask, xK_l), sendMessage Expand)
          , ((modMask .|. shiftMask, xK_p), raiseMaybe (runInTerm "-T btop" "btop") (title =? "btop"))
          , ((modMask .|. shiftMask, xK_s), screenshot)
          , ((modMask              , xK_c), spawn "clipmenu")

    -- register scratchpads
          , ((modMask, xK_o), namedScratchpadAction myScratchPads "finder")
          , ((modMask .|. shiftMask, xK_t), namedScratchpadAction myScratchPads "task")
    -- multi media keys
          , ((0, xF86XK_AudioMute) , spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle")
          , ((0, xF86XK_AudioLowerVolume) , spawn "pactl set-sink-volume @DEFAULT_SINK@ -10%")
          , ((0, xF86XK_AudioRaiseVolume) , spawn "pactl set-sink-volume @DEFAULT_SINK@ +10%")

    -- floating layer support
          , ((modMask, xK_t) , withFocused $ windows . W.sink)

    -- quit, or restart
          , ((modMask .|. shiftMask, xK_q), io exitSuccess)
          , ((mod4Mask,xK_q), restart "xmonad" True )
          ] ++
    -- mod-[1..9] %! Switch to workspace N
    -- mod-shift-[1..9] %! Move client to workspace N
           [ ((m .|. modMask, k), windows $ f i)
           | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
           , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]
           ]

screenshot :: X ()
screenshot = do
  time <- io getCurrentTime
  spawn $ "maim -s ~/screenshot_" ++ show time ++ ".png"

---------------------------------------
-- LAYOUTS
---------------------------------------

myLayout = avoidStruts $ smartBorders $ boringWindows (full ||| tall)
  where
    full    = renamed [Replace "FS"] (minimize Full)
    tall    = renamed [Replace "TL"] (minimize (Tall nmaster delta ratio))
    nmaster = 1
    ratio   = 1 / 2
    delta   = 3 / 100


---------------------------------------
-- MANAGEMENT HOOKS
---------------------------------------

myManageHook =
  composeAll
    [ isPrefixOf "jetbrains" <$> className --> doShift "Dev"
    , isPrefixOf "Vivaldi"   <$> className --> doShift "Web"
    , (className =? "Slack")               --> doShift "Chat"
    ] <+>
  manageHook def

---------------------------------------
-- SCRATCH PADS
---------------------------------------

myScratchPads :: [NamedScratchpad]
myScratchPads =
    [ NS "finder" spawnFinder findFinder manageFinder
    , NS "task" spawnTask findTask manageTask
    ]
  where
    spawnFinder  = "kitty -T broot broot"
    findFinder   = appName =? "broot" <||> title =? "broot"
    manageFinder = customFloating $ W.RationalRect l t w h
      where
        h = 0.9
        w = 0.9
        t = 0.95 - h
        l = 0.95 - w

    spawnTask = "kitty -T tasksh tasksh"
    findTask  = title =? "tasksh"
    manageTask = customFloating $ W.RationalRect l t w h
      where
        h = 0.9
        w = 0.9
        t = 0.95 - h
        l = 0.95 - w
