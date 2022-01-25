pkexec pacman -Syu --noconfirm
if [ $? != 0 ]; then 
    butlermsg "$errormsg"
fi