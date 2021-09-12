savelocation="$(yad --file --text="$where" --filename=$(whoami)-homebackup-$(date +%D | sed 's/\//-/g').tar.gz --save)"
if [ "$?" == "0" ]; then
	tar --exclude-caches --exclude="~/.cache" -cf $savelocation ~
	if [ "$?" == "0" ]; then
		butlermsg "$savelocation1 $archivename.tar.gz $savelocation2 $savelocation."
	else
		butlermsg "$failure"
	fi
else
	butlermsg "$failure"
fi
