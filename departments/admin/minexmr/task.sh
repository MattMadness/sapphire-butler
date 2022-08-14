if [ -f "~/.xmrig.json" ]; then
	xmrig
else
	curl "https://raw.githubusercontent.com/xmrig/xmrig/master/src/config.json" > ~/.xmrig.json
	if [ $? != 0 ]; then
		cp /usr/share/sapphire-butler/admin/minexmr/config.json ~/.xmrig.json
	fi
	butlermsg "$begin"
	read -r -p "$msgwallet" wallet
	read -r -p "$msgemail" email
	pool="swimming"
	while [[ $pool == "swimming" ]]; do
		echo "$msgpool"
		echo "(1) $hashvault"
		echo "(2) $minexmr"
		echo "(3) $nanopool"
		echo "(4) $other"
		read -r -p "? " response
		if [ $response == 1 ]; then
			pool="pool.hashvault.pro:3333"
		elif [ $response == 2 ]; then
			pool="pool.minexmr.com:443"
		elif [ $response == 3 ]; then
			printf "$nanopooltest"
			declare -a nanopools=("xmr-eu1.nanopool.org" "xmr-eu2.nanopool.org" "xmr-us-east1.nanopool.org" "xmr-us-west1.nanopool.org" "xmr-asia1.nanopool.org" "xmr-jp1.nanopool.org" "xmr-au1.nanopool.org")
			declare -a poolspeeds=()
			poolcount=0
			for napool in ${nanopools[@]}; do
				poolspeeds+=$(ping -c 3 -q $napool | grep "rtt min/avg/max/mdev" | cut -c 24- | cut -d/ -f2)
			done
			topspeed=10000000000000000000
			speednum=0
			for speed in ${poolspeeds[@]}; do
				((speednum++))
				if (( $(echo $topspeed '>' $speed | bc) )); then
					topspeed=$speed
					fastestpool=$speednum
				fi
			done
			pool="${nanopools[$fastestpool]}"
			printf "$pool\n"
		elif [ $response == 4 ]; then
			read -r -p "$msgpool2" pool
		fi
	done
	read -r -p "$msgminername ($(hostname)): " $minername
	if [ $minername == "" ]; then
		minername=$(hostname)
	fi
	read -r -p "$msgpauseonbattery" pauseonbattery
	if [ $pauseonbattery != "y" ] || [ $pauseonbattery != "Y" ]; then
		pauseonbattery=false
	else
		pauseonbattery=true
	fi
	read -r -p "$msgpauseonactive" pauseonactive
	if [ $pauseonactive != "y" ] || [ $pauseonactive != "Y" ]; then
		pauseonactive=false
	else
		pauseonactive=true
	fi
	xmrConfMod() {
		jq -c "$1" ~/.xmrig.json > ~/.xmrig.json
	}
	xmrConfMod ".pools.url = $pool"
	xmrConfMod ".pools.user = $wallet"
	xmrConfMod ".pools.pass = $minername:$email"
	xmrConfMod ".pause-on-battery = $pauseonbattery"
	xmrConfMod ".pause-on-active = $pauseonactive"
	butlermsg "Further configuration may be needed. Opening the file now..."
	working=false
	while [ $working == "false" ] ; do
		$EDITOR ~/.xmrig.json
		butlermsg "Testing configuration..."
		xmrig --dry-run -c ~/.xmrig.json
		if [ $? == 0 ]; then
			butlermsg "XMRig successfully configured. Run this task again to start the miner."
			working=true
		else
			butlermsg "XMRig config is not functional. Please check the errors provided and try again."
			working=false
		fi
	done
fi
