pkexec timedatectl set-ntp false
if [ $? == 0 ]; then
    butlermsg "$success"
else
    butlermsg "$failure"
fi
