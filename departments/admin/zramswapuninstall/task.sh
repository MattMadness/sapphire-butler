disablezramswap() {
	systemctl stop zram-swap
	systemctl disable zram-swap
	for file in "$(find /usr/share/sapphire-butler/departments/admin/zramswapinstall/etc)"; do
       		rm "/$file"
	done
}
pkexec
