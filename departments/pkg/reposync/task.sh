pkexec pacman -Sy
if [ $? == 0 ]; then
	butlermsg "$success"
else
	butlermsg "$failure"
fi
