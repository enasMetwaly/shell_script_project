



 #!/bin/bash
 
 read -p "Enter a table name: " tbName
 
                        if [[ -f $tbName ]]; then
                                echo "The DB Exists ";
                                echo "Are you Sure You Want To drop $tbName Database? y/n"
                                read choice;
                                        case $choice in
                                        [Yy]* ) rm -r $tbName 
                                                
                                        #  done 
                                                echo "$tbName has been deleted"  ;;
                                        # canceled
                                        [Nn]* ) echo "Operation Canceled"  ;;
                                        # wrong input
                                                * ) echo "Invalid Input"       ;;
                                        esac
                        else
                                echo "$tbName doesn't exist"
                                echo  "choose  anthor choice"
                        fi 
                        
                        tableMenu.sh

