pkexec systemctl disable zram-swap
if [ $? == 2 ]; then
	butlermsg "$failure"
else
	butlermsg "$success"
fi
