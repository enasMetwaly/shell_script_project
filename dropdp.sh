#!/bin/bash

 read -p "Enter A DropDB Name: " name
                         if [[ -z $name  ]];
                                then 
                                        tput setaf 1
                                        echo "Empty Input"
                                        
                                      

                                elif [[ $name =~ ['!@#$%^&*()_+'] ]];
                                then
                                        
                                        echo "incorrect input"
                                        
                                        else
                        if [[ -d ~/dbshells/databases/$name ]]; then
                                echo "The DB Exists ";
                                echo "Are you Sure You Want To drop $name Database? y/n"
                                read choice;
                                case $choice in
                                        [Yy]* ) rm -r ~/dbshells/databases/$name
                                              
                                        #  done 
                                                echo "$name has been deleted"  ;;
                                        # canceled
                                        [Nn]* ) echo "Operation Canceled"  ;;
                                        # wrong input
                                                * ) echo "Invalid Input"       ;;
                                        esac
                        else
                                echo "$name doesn't exist"
                        fi 
                        fi
                        
                        main.sh
                        
