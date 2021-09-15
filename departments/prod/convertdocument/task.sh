inputfile=$(yad --title="$name" --file --text="$choosefile")
outputfile=$(yad --title="$name" --file --save --filename="$inputfile" --text="$choosesave")
#inputformat=$(echo $(pandoc --list-input-formats) | yad --title="$name" --list --column="$inputformattxt" --text="$inputformatdialog")
#outputformat=$(echo $(pandoc --list-output-formats) | yad --title="$name" --list --column="$outputformattxt" --text="$outputformatdialog")
butlermsg "$pleasewait"
#pandoc -f $inputformat -t $outputformat "$inputfile"
pandoc "$inputfile" -o "$outputfile"
if [ $? == 0 ]; then
	butlermsg "$success"
else
	butlermsg "$failure"
fi
