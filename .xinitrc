#!/bin/sh

while true
do
	# Previous display
	#xsetroot -name "`date` `uptime | sed 's/.*,//'`"

	# Check battery level
	BATT=$( acpi -b | sed 's/.*[charging|unkown], \([0-9]*\)%.*/\1/gi')
	STATUS=$( acpi -b | sed 's/.*: \([a-zA-Z]*\),.*/\1/gi')

	xsetroot -name "`date ` `echo $BATT% $STATUS`"
	# Updates every 1 minute
	sleep 1m
done &

# Set wallpaper
feh --bg-scale -F ~/.xwallpaper-dwm.png

#Set WM name ( for Java apps)
wmname LG3D

xrdb -merge .Xresources

urxvtd -q -o -f
exec dwm
