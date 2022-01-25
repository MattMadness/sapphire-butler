BLANG=$(echo $LANG | cut -c1-2)
taskname="$name"
declare -a tasks=($(find /usr/share/sapphire-butler/departments/ -iname task.sh | sed -e 's/\/usr\/share\/sapphire-butler\/departments\///g' -e 's/\/task.sh//g' | sort))
len=${#tasks[@]}
formattasklist() {
	for (( i = 0; i < len; i++ )); do
		if [ -f "/usr/share/sapphire-butler/i18n/${tasks[$i]}/${BLANG}" ]; then
			source /usr/share/sapphire-butler/i18n/${tasks[$i]}/$BLANG
		elif [ -f "/usr/share/sapphire-butler/i18n/${tasks[$i]}/en" ]; then
			source /usr/share/sapphire-butler/i18n/${tasks[$i]}/en
		else
			source /usr/share/sapphire-butler/i18n/${tasks[$i]}/$(find -type f /usr/share/sapphire-butler/i18n/${tasks[$1]}/ | head -1)
		fi
		echo "$name "
		echo "${tasks[$i]} "
		echo "$description "
	done
}
declare -a do=($(formattasklist | yad --list --title="$taskname" --window-icon="/usr/share/sapphire-butler/butlerface.png" --geometry=800x700 --text="$yadtext" --column="Name" --column="Department/Task" --column="Description" | cut -d '|' -f2))
len=${#do[@]}
for (( i = 0; i < len; i++ )); do
	butler ${do[$i]}
done
yad --title="$taskname" --window-icon="/usr/share/sapphire-butler/butlerface.png" --text="$yadtextdomore" --button="No":2 --button="Yes":3
if [ "$?" == "3" ]; then
	butler prod/butleryad
fi
