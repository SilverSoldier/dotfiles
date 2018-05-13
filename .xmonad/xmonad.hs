import System.IO
import System.Exit
import XMonad
import XMonad.Actions.WindowGo -- provides runOrRaise
import XMonad.Hooks.DynamicLog -- for xmobar
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers -- provides isDialog
import XMonad.Hooks.UrgencyHook
import XMonad.Prompt -- prompts
import XMonad.Prompt.Man --man page prompt
import XMonad.Util.Run(spawnPipe, runInTerm)
import XMonad.Util.NamedScratchpad --scratchpad terminal
import XMonad.Util.EZConfig
import XMonad.Util.Scratchpad --scratchpad terminal
import Colors.MyColors --personal colors, defined in Colors/MyColors

import qualified Data.Map as M
import qualified Data.List as L -- provides isInfixOf, used for mySearchPredicate
import qualified Data.Char as C -- provides toLower, used for mySearchPredicate
import qualified XMonad.StackSet as W

myModMask = mod1Mask

myFont = "xft:monospace:size=15"

myWorkspaces = ["1:web","2","3","4q","5w:mail", "6e", "7a", "8s", "9d:org"]
myExtraWorkspaceKeys = [ (xK_exclam, "1:web"), (xK_at, "2"), (xK_numbersign, "3"), (xK_q, "4q"), (xK_w, "5w:mail"), (xK_e, "6e"), (xK_a, "7a"), (xK_s, "8s"), (xK_d, "9d:org") ]

myManageHook = 
	scratchpadManageHook (W.RationalRect 0.25 0.375 0.5 0.35) <+>
	( composeAll . concat $ 
	[ [ className =? "thunderbird" --> doShift "5w:mail" ]
	, [ className =? "Xmessage"    --> doFloat ]
	, [ className =? "Gxmessage"   --> doFloat ]
	])

-- Color of current window title in xmobar.
xmobarTitleColor = myLightGreen

-- Color of current workspace in xmobar.
xmobarCurrentWorkspaceColor = myLightGreen

myAdditionalKeys =
	[ ((0, xK_Print), spawn "urxvt")
	, ((myModMask, xK_b), spawn "firefox-57")
	, ((myModMask, xK_t), spawn "alacritty")

	-- scratchpad - does not work completely
	, ((myModMask, xK_z), scratchpadSpawnAction defaultConfig {terminal = myTerminal})

	-- call dmenu
	, ((myModMask, xK_p), spawn "dmenu_run -nb black -nf '#4DC425' -sb '#4DC425' -sf black")

	-- shortcut for htop
	, ((myModMask, xK_h), raiseMaybe ( runInTerm "" "htop" ) ( title =? "htop" ))

	-- Restart xmonad
	, ((myModMask, xK_r), restart "xmonad" True)

	-- Quit xmonad.
	, ((myModMask .|. shiftMask, xK_r), io (exitWith ExitSuccess))

	] ++ [
	  ((myModMask, key), (windows $ W.greedyView ws))
	  | (key, ws) <- myExtraWorkspaceKeys
	] ++ [
	  ((myModMask .|. shiftMask, key), (windows $ W.shift ws))
	  | (key, ws) <- myExtraWorkspaceKeys
	]

myTerminal = "urxvt"

main = do 
	xmproc <- spawnPipe "xmobar /home/kavya/.xmobarrc" -- start xmobar
	xmonad $ defaultConfig
		{ terminal = myTerminal
		, modMask = myModMask
		, borderWidth = 1
		, normalBorderColor = "#ababab"
		, focusedBorderColor = myDarkGreen
		, layoutHook = avoidStruts  $  layoutHook defaultConfig
		, manageHook = manageDocks <+> myManageHook 
		, logHook = dynamicLogWithPP xmobarPP
				{ ppOutput = hPutStrLn xmproc
				, ppTitle = xmobarColor xmobarTitleColor "" . shorten 50
				, ppCurrent = xmobarColor xmobarCurrentWorkspaceColor ""
				, ppSep = "    "
				}
		, workspaces = myWorkspaces
		}
		`additionalKeys` myAdditionalKeys

