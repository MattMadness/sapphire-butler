systemctl start minecraftd
if [ $? == 0 ]; then
	systemctl enable minecraftd
	butlermsg "$success"
else
	butlermsg "$failure"
fi
