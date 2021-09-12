sourcefile=$(yad --title="$name" --file --text="$choosefile")
fileformat=$(convert -list format | perl -ane '($f,$m,$c,$d)=m/^\s*(\S*?)\**\s*(\S*)\s*([r-][w-][+-])\s*(.*)$/g;if($c=~m/^.w.$/){print join "\n",$f,$d,""}' | yad --title="$name" --list --print-column=1 --column="$(gettext 'Format')" --column="$(gettext 'Description')" --text="$chooseformat" | sed 's/|//g')
choosesave=$(yad --title="$name" --file --text="$choosesave" --save --filename="$sourcefile.$fileformat")
butlermsg "$pleasewait"
convert "$sourcefile" "$choosesave"
if [ $? == 0 ]; then
	butlermsg "$success"
else
	butlermsg "$failure"
fi
