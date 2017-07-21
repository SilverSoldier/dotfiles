import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO

import qualified Data.Map as M

main = do 
	xmonad $ defaultConfig
		{ manageHook = manageDocks <+> manageHook defaultConfig
		, layoutHook = avoidStruts  $  layoutHook defaultConfig
		, terminal = "urxvt"

		-- keybindings
		-- , keys = myKeys
		}

-- myKeys conf@(XConfig {}) = M.fromList $
---------------------------------------------------------------
------- Custom Key Bindings
--
	-- [((0, xK_Print),
	-- 	spawn $ XMonad.terminal conf)]
