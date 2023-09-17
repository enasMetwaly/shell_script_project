#!/bin/bash
select option in "Create Database" "List Databases"   "Connect Database" "Drop database" "exit"
do
  # Execute different commands based on user's choice
  case "$option" in
    "Create Database")
       # run createdatabase file
       chmod +x  ~/dbshells/createdb.sh 
      ~/dbshells/createdb.sh 
      break;;
    "List Databases")
       chmod +x  ~/dbshells/listdb.sh 
       
       ~/dbshells/listdb.sh
      break;;
    "Connect Database")
      chmod +x   ~/dbshells/connectdb.sh 
       . ~/dbshells/connectdb.sh
      break;;
    "Drop database")
     echo dropdp
      chmod +x  ~/dbshells/dropdp.sh   
      . ~/dbshells/dropdp.sh      
      break;;
     "exit")
      exit 0
      break;;
    *)
      # Handle invalid input with an error message 
      echo "Invalid option. Please enter a number between 1 and 5."
      break;;
  esac 
done

