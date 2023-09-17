#!/bin/bash

read -p "Please enter the name of the database you want to connect to" dbname

exitflag=0
while [ $exitflag -eq 0 ];do
	if [ -z $dbname ];then
		echo -n "Please enter a name: "
		read name
		continue
	fi
	if [ -d  ~/dbshells/databases/$dbname ]; then
	    echo "Database found"
	    exitflag=1    
	else
		echo "No such Database found"
		read -p "Enter another name: " new_dbname
		dbname=$new_dbname 		
	fi
done


# Check if the connection was successful 
if [ $exitflag == 1 ]; then
     cd  ~/dbshells/databases/"$dbname"  # Enclose the path in double quotes
     echo "You are connected successfully to $dbname database"   
     . tableMenu.sh
fi

