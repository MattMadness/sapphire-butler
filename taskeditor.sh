#!/bin/bash

# Get language
BLANG=$(echo $LANG | cut -c1-2)

response="0"

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

echo "Welcome to this easy Sapphire Butler Task Editor."
echo
echo "Would you like to do?"
echo "(1) Create a new task."
echo "(2) Edit an existing task."
echo "(3) Exit."
read -r -p "? " response

if [ $response == "1" ]; then
    read -r -p "Type a [DEPARTMENT]/[TASK] to create: " dt

    if [[ -f "departments/$dt/task.sh" ]]; then
        echo "Sorry $(whoami), the task \"$dt\" already exists."
        exit
    fi

    mkdir i18n/$dt
    echo -e "name=\"TASK NAME HERE\"\ndescription=\"DESCRIPTION HERE\"" > i18n/$dt/$LANG
    mkdir departments/$dt
    touch departments/$dt/task.sh
    
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
    echo "Why bother then?"
    exit
fi
