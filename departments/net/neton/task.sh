nmcli n on
if [ "$?" == "0" ]; then
	butlermsg "$saysuccess"
else
	butlermsg "$sayfailure"
fi
