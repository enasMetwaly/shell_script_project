#!/usr/bin/bash

echo -n "Please enter the database name: "
read name
exitflag=0


while [ $exitflag -eq 0 ];do

if [[ $name == *['!''?'@\#\$%^\&*()-+\.\/';']* ]]
then
	echo "! @ # $ % ^ () ? + ; . -  are not allowed!"
	echo -n "Please enter a valid name: "
	read name
	continue
fi
if [[ "$name" =~ [0-9] ]]; then
    echo "Numbers are not allowed in the name!"
    echo -n "Please enter a valid name: "
    read name
    continue
fi

if [[ $name = *" "* ]]; then
	echo "spaces are not allowed!"
	echo -n "Please enter a valid name: "
	read name
	continue
fi

if [ -z $name ];then
echo -n "Please enter a name: "
read name
continue
fi
if [ -d dbs/$name ];then
	echo "Database already exists"
	echo -n "Please enter another name: "
	read name
else
	mkdir databases/$name/
	echo "Database created successfully"
	exitflag=1
	main.sh
fi
done
