swayidle -w \
  timeout 500 'swaylock -e -f -i ${HOME}/.config/swaylock/background.jpeg' \
  timeout 1000 'swaymsg "output \* dpms off"' \
  timeout 2000 'systemctl suspend' \
	      resume 'swaymsg "output \* dpms on"'
