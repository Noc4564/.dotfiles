#!/bin/bash

# This script is a modified version of this script: https://github.com/acarl005/dotfiles/blob/master/waybar/scripts/power-menu.sh

set -e

DISPLAY_NAMES=(Lock Shutdown Restart Sleep)
COMMANDS=('${HOME}/.config/swaylock/lock.sh' 'systemctl poweroff' 'systemctl reboot' 'systemctl suspend')
ICON_PATHS=(
   # Lock
  󰐥 # Shutdown
  󰜉 # Restart
  󰒲 # Sleep
)

MENU_ITEMS=()
for i in "${!DISPLAY_NAMES[@]}"; do
  MENU_ITEMS+=("${ICON_PATHS[i]}:${DISPLAY_NAMES[i]}")
done

CHOICE=$(printf '%s\n' "${MENU_ITEMS[@]}" | wofi --show dmenu)

# Extract label from `text:...`
SELECTED_NAME="${CHOICE#*:}"

# Match selection and run command
for i in "${!DISPLAY_NAMES[@]}"; do
  if [[ "${DISPLAY_NAMES[i]}" == "$SELECTED_NAME" ]]; then
    eval "${COMMANDS[i]}"
    break
  fi
done

