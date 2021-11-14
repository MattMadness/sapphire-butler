link=$(yad --form --window-title="$name" --text="$dialog1" --field="Link")
yad --window-title="$name" --image="audio-x-generic-symbolic" --text="$dialog2" --button="Audio":2 --button="Video":3
if [ $? == 2 ]; then
    youtube-dl -x $link
elif [ $? == 3 ]; then
    youtube-dl $link
fi
