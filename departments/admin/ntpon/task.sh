pkexec timedatectl set-ntp true
if [ $? == 0 ]; then
    butlermsg "$success"
else
    butlermsg "$failure"
fi
