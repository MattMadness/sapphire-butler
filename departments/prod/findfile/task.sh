read -r -p "$fileq " file
if [ -n "$file" ]; then
    find . -type f -iname '*'"$file"'*' -ls ;
else
    butlermsg "$err"
fi