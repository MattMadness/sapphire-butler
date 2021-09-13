systemctl stop zram-swap
systemctl disable zram-swap
rm /etc/modprobe.d/zram.conf
rm /etc/systemd/system/zram-swap.service
rm /etc/modules-load.d/zram.conf
rm /etc/udev/rules.d/99-zram.rules
