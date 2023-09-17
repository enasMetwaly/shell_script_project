#!/bin/bash



select option in "Create Table" "List Table" "Drop table"  "Insert Into Table"  "Select From Table" "Update Table" "Delete From Table"   "exit"
do
  # Execute different commands based on user's choice
  case "$option" in
  
    "Create Table")
       # run createtable file
        chmod +x  ~/dbshells/create_table.sh                       
        ~/dbshells/create_table.sh                          

      break;;     
    "List Table")
        echo "listtable"
          chmod +x  ~/dbshells/list_tables.sh                          
         ~/dbshells/list_tables.sh  
        
       break;;     
    "Drop table")
        echo "drop table"
          chmod +x  ~/dbshells/droptable.sh                          
         ~/dbshells/droptable.sh  
        break;;    
     "Insert Into Table")
          chmod +x  ~/dbshells/insert.sh                          
         ~/dbshells/insert.sh  
          break;;      
     "Select From Table")
        echo "select from table"
         chmod +x  ~/dbshells/select.sh                          
 	~/dbshells/select.sh 
        
         break;;            
     "Update Table")
         echo "updata"
         chmod +x  ~/dbshells/update.sh                          
         ~/dbshells/update.sh  
         break;;
     "Delete From Table")
          echo "delet from table"
          chmod +x  ~/dbshells/deletefrom_table.sh                       
         ~/dbshells/deletefrom_table.sh
          break;;

      
     "exit")
      exit 0
      break;;
      
      *)
        # Handle invalid input with an error message 
       echo "Invalid option. Please enter a number between 1 and 8"
       . tableMenu.sh
       break;;
  esac 
done

