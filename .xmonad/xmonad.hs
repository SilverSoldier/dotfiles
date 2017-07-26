import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

import qualified Data.Map as M
import qualified XMonad.StackSet as W

myModMask = mod1Mask

myWorkspaces = ["1:web","2","3","4q","5w:mail", "6e", "7a", "8s", "9d:org"]
myExtraWorkspaceKeys = [ (xK_q, "4q"), (xK_w, "5w:mail"), (xK_e, "6e"), (xK_a, "7a"), (xK_s, "8s"), (xK_d, "9d:org") ]

myManageHook = composeAll
	[ className =? "thunderbird" --> doShift "5w:mail" ]

-- Color of current window title in xmobar.
xmobarTitleColor = "#CEFFAC"


-- Color of current workspace in xmobar.
xmobarCurrentWorkspaceColor = "#CEFFAC"

myAdditionalKeys =
	[ ((0, xK_Print), spawn "urxvt")
	, ((myModMask, xK_b), spawn "iceweasel")
	-- Restart xmonad
	, ((myModMask, xK_r), restart "xmonad" True)
	] ++ [
	  ((myModMask, key), (windows $ W.greedyView ws))
	  | (key, ws) <- myExtraWorkspaceKeys
	] ++ [
	  ((myModMask .|. shiftMask, key), (windows $ W.shift ws))
	  | (key, ws) <- myExtraWorkspaceKeys
	]


main = do 
	xmproc <- spawnPipe "xmobar /home/kavya/.xmobarrc"
	xmonad $ defaultConfig
		{ terminal = "urxvt"
		, modMask = myModMask
		, layoutHook = avoidStruts  $  layoutHook defaultConfig
		, manageHook = manageDocks <+> myManageHook 
		, logHook = dynamicLogWithPP xmobarPP
				{ ppOutput = hPutStrLn xmproc
				, ppTitle = xmobarColor xmobarTitleColor "" . shorten 50
				, ppCurrent = xmobarColor xmobarCurrentWorkspaceColor ""
				, ppSep = "    "
				}
		, workspaces = myWorkspaces
		} `additionalKeys`
		myAdditionalKeys

