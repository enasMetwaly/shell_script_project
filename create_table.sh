#!/bin/bash

read -p "enter Table Name " tablename


# Check if the subdirectory exists in the home directory using the -d option
if [ -f $tablename ]; then
	# If yes, print a message saying it exists
	echo "The subdirectory $dbname exists."
	. tableMenu.sh 
	
else
	# If no, print a message saying it does not exist
	echo "The table $dbname does not exist in  directory."   
	#check databasename rules
	# Check if the dbname is empty or contains invalid characters
	if [[ -z $tablename ]] || ! [[ $tablename =~ ^[0-9a-zA-Z._-]+$ ]]; then
		# If yes, print an error message and return 1
		echo \"Invalid database name: $dbname\"

	else  
		echo valid table name
		. meta_data.sh $tablename
		touch  "$tablename"

		echo Table created successfully
		fi
fi 




