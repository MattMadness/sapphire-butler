if [ -f "/usr/bin/systemctl" ]; then
	systemctl reboot
elif [ -f "/usr/bin/loginctl" ]; then
	loginctl reboot
elif [ -f "/usr/bin/reboot" ]; then
	sudo reboot
fi
