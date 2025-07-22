swayidle -w \
  timeout 300 'swaylock -e -f -i ${HOME}/.config/swaylock/background.jpeg' \
  timeout 600 'swaymsg "output \* dpms off"' \
  timeout 660 'systemctl suspend' \
	      resume 'swaymsg "output \* dpms on"'
