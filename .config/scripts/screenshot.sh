#!/bin/bash

# Screenshot directory
SAVE_DIR="$HOME/Pictures/Screenshots"
mkdir -p "$SAVE_DIR"

# Timestamp for filename
TIMESTAMP=$(date +'%Y-%m-%d_%H-%M-%S')

# Temporary file
FILE="$SAVE_DIR/screenshot_$TIMESTAMP.png"

# Choose mode using wofi
CHOICE=$(echo -e "Fullscreen\nRegion\nScreen" | wofi --dmenu --prompt "Screenshot mode:")

case "$CHOICE" in
    "Fullscreen")
        # Capture all displays
        grim "$FILE"
        ;;
    "Region")
        # Select region and capture
        slurp | grim -g - "$FILE"
        ;;
	# Select which screen to capture
    "Screen")
        # Get monitor list from hyprctl and format for wofi
        MONITOR=$(hyprctl monitors | awk -F'[:,]' '/Monitor/ {mon=$2} /at/ && /res/ {gsub(/[ x+]/," "); print mon ": " $3 "x" $4 "+" $5 "+" $6}' | wofi --dmenu --prompt "Select screen:")

        if [ -z "$MONITOR" ]; then
            notify-send "Screenshot" "Monitor selection cancelled."
            exit 1
        fi

        # Extract geometry from selection (e.g., 1920x1080+0+0)
        GEOM=$(echo "$MONITOR" | grep -oP '\d+x\d+\+\d+\+\d+')
        grim -g "$GEOM" "$FILE"
        ;;
    *)
        notify-send "Screenshot" "Invalid option or canceled."
        exit 1
        ;;
esac

# Copy to clipboard
wl-copy < "$FILE"

# Optional: notify user
notify-send "Screenshot" "Saved and copied to clipboard: $FILE"

