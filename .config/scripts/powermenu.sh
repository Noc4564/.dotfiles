#!/bin/bash

set -e

DISPLAY_NAMES=(Lock Logout Shutdown Restart Sleep)
COMMANDS=('${HOME}/.config/swaylock/lock.sh' 'hyprctl dispatch exit' 'systemctl poweroff' 'systemctl reboot' 'systemctl suspend')
ICON_PATHS=(
   # Lock
  󰍃 # Logout
   # Shutdown
  󰜉 # Restart
  󰒲 # Sleep
)

MENU_ITEMS=()
for i in "${!DISPLAY_NAMES[@]}"; do
  MENU_ITEMS+=("${ICON_PATHS[i]}:${DISPLAY_NAMES[i]}")
done

CHOICE=$(printf '%s\n' "${MENU_ITEMS[@]}" | wofi --show dmenu)

# Extract label from `text:...`
SELECTED_NAME="${CHOICE#*:text:}"

# Match selection and run command
for i in "${!DISPLAY_NAMES[@]}"; do
  if [[ "${DISPLAY_NAMES[i]}" == "$SELECTED_NAME" ]]; then
    eval "${COMMANDS[i]}"
    break
  fi
done

