BLANG=$(echo $LANG | cut -c1-2)
taskname="$name"
declare -a tasks=($(find /usr/share/sapphire-butler/departments/ -iname task.sh | sed -e 's/\/usr\/share\/sapphire-butler\/departments\///g' -e 's/\/task.sh//g' | sort))
len=${#tasks[@]}
formattasklist() {
	for (( i = 0; i < len; i++ )); do
		if [ -f "/usr/share/sapphire-butler/i18n/$1/$BLANG" ]; then
			source /usr/share/sapphire-butler/i18n/$1/$BLANG
		elif [ -f "/usr/share/sapphire-butler/i18n/$1/en" ]; then
			source /usr/share/sapphire-butler/i18n/$1/en
		else
			source /usr/share/sapphire-butler/i18n/$1/$(find -type f /usr/share/sapphire-butler/i18n/$1/ | head -1)
		fi
		echo "FALSE "
		echo "$name "
		echo "${tasks[$i]} "
		echo "$description "
	done
}
declare -a do=($(formattasklist | yad --list --title="$taskname" --window-icon="/usr/share/sapphire-butler/butlerface.png" --geometry=800x700 --text="$yadtext" --column="Do?" --column="Name" --column="Department/Task" --column="Description" --checklist | cut -d '|' -f3))
len=${#do[@]}
for (( i = 0; i < len; i++ )); do
	butler ${do[$i]}
done
