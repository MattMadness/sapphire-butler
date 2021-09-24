if [ -f "/usr/bin/pamac" ]; then
    pkexec pamac upgrade --no-confirm
elif [ -f "/usr/bin/pacman" ]; then
    pkexec pacman -Syu --noconfirm
else
    pkexec pkcon update -y
fi
