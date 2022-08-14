if [ -f "/usr/bin/systemctl" ]; then
	systemctl poweroff
elif [ -f "/usr/bin/loginctl" ]; then
	loginctl poweroff
elif [ -f "/usr/bin/reboot" ]; then
	sudo poweroff
fi