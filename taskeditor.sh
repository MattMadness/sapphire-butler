#!/bin/bash

# Get language
BLANG=$(echo $LANG | cut -c1-2)

butlerlang() {
    # Obtain variable data from language files
    if [ -f "i18n/$1/$BLANG" ]; then
        source i18n/$1/$BLANG
    elif [ -f "i18n/$1/en" ]; then
        source i18n/$1/en
    else
        source i18n/$1/$(find -type f i18n/$1/ | head -1)
    fi
}

echo "Welcome to this easy Sapphire Butler Task Editor."
echo

response="0"

while [ $response != 4 ]; do
    echo "Use \"${BLANG}\" as the language?"
    read -r -p "(y/n) " response
    
    if [ $response == "n" ]; then
	    echo "Type a new language code. For example, English is en, Spanish is es, Chinese is zh, French is fr, German is de, Italian is it, Japanese is ja, Russian is ru. Check https://saimana.com/list-of-country-locale-code/ for a larger list."
	    read -r -p "Language Code: " BLANG
    fi	
    echo
    
    if [ ! -n "$EDITOR" ]; then 
        EDITOR=nano
    fi
    
    response="0"
    
    echo "Would you like to do?"
    echo "(1) Create a new task."
    echo "(2) Edit an existing task."
    echo "(3) List existing tasks."
    echo "(4) Exit."
    read -r -p "? " response
    
    if [ $response == "1" ]; then
        read -r -p "Type a [DEPARTMENT]/[TASK] to create: " dt
    
        if [[ -f "departments/$dt/task.sh" ]]; then
            echo "Sorry $(whoami), the task \"$dt\" already exists."
            exit
        fi
    
        mkdir i18n/$dt
        echo -e "name=\"TASK NAME HERE\"\ndescription=\"DESCRIPTION HERE\"" > i18n/$dt/$BLANG
        mkdir departments/$dt
        touch departments/$dt/task.sh
        
        echo "Ready."
        
        while [ $response != "5" ]; do
            echo "What would you like to do now?"
            echo "(1) Edit the i18n file."
            echo "(2) Edit the task file."
            echo "(3) Edit the dependencies file."
            echo "(4) Start a shell."
            echo "(5) Exit."
            read -r -p "? " response
            if [ $response == "1" ]; then
    	        $EDITOR i18n/$dt/$BLANG
            elif [ $response == "2" ]; then
    	        $EDITOR departments/$dt/task.sh
            elif [ $response == "3" ]; then
    	        $EDITOR departments/$dt/dependencies.list
            elif [ $response == "4" ]; then
                $SHELL
            fi
        done
    elif [ $response == "2" ]; then
        read -r -p "Type a [DEPARTMENT]/[TASK] to edit: " dt
    
        if [[ ! -f "departments/$dt/task.sh" ]]; then
            echo "Sorry $(whoami), the task \"$dt\" does not exist."
            exit
        fi
    
        echo "Ready."
        
        while [ $response != "4" ]; do
            echo "What would you like to do now?"
            echo "(1) Edit the i18n file."
            echo "(2) Edit the task file."
            echo "(3) Start a shell."
            echo "(4) Exit."
            read -r -p "? " response
            if [ $response == "1" ]; then
    	        $EDITOR i18n/$dt/$BLANG
            elif [ $response == "2" ]; then
    	        $EDITOR departments/$dt/task.sh
            elif [ $response == "3" ]; then
                $SHELL
            fi
        done
    elif [ $response == "3" ]; then
        echo -e "\033[01;36m[❖ BUTLER]\033[0m Available tasks:"
        declare -a tasksearchresults=($(find "/usr/share/sapphire-butler/departments/" -name task.sh | sed -e 's/\/usr\/share\/sapphire-butler\/departments\///g' -e 's/\/task.sh//g' | sort))
        printf "\t%-35s %-30s" "Name" "Department/Task"
        echo -e "\n-----------------------------------------------------------------"
        for tasksearch in ${tasksearchresults[@]}; do
            butlerlang $tasksearch
            printf "%-35s %-30s" "$name" "$tasksearch"
            echo
        done
	echo
    elif [ $response == "4" ]; then
        echo "Goodbye!"
        exit
    fi
done
