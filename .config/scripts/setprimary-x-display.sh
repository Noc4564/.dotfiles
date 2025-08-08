#!/bin/bash

# get configured monitor line from configured main display in hyprland.conf
mainWorkspace=$(grep workspace= "$HOME/.config/hypr/hyprland.conf") 
echo "$mainWorkspace"
# refine into just the monitor name
# '#*' basically removes the front portion of the string leaving the end part to be set as the monitor variable. it is more compolicated than that but works that way for this context
monitor=${mainWorkspace#*monitor:}
echo "$monitor"
# finally set said name as primary x11 display
xrandr --output $monitor --primary
