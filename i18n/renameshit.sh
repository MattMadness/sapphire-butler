caps=$(find . -type f)

for item in $caps; do
    mv $item $(echo $item | sed -e 's/en_US.utf8/en/g' -e 's/en_US.UTF-8/en/g')
done
