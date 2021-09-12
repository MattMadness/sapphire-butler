pkexec systemctl enable zram-swap
if [ $? == 2 ]; then
	butlermsg "$failure"
else
	butlermsg "$success"
fi
