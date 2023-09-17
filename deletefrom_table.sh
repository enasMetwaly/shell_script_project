

#!/bin/bash

read -p "enter table Name you want to delete from:  " tableName

function deleteRecord {
           local dbtable=$tableName
           break_loop=0
	  while [ "$break_loop" -eq 0 ]; do   
		  if ! [  -f "$tableName" ]; then
		    echo "Table $tableName doesn't exist."
		    echo "Please enter another table: "
		    read new_table
		    tableName="$new_table"
		  else
		    break_loop=1
		    break
	  	  fi
	 done

        if [ ! -s "$tableName" ]; then
	      echo "The file is empty."
	      echo "select another operation"
	      		tableMenu.sh
	      
	else




	
	
	echo -e "Enter Condition Column name: \c"
		  read field
		  fid=$(awk 'BEGIN{FS="|"}{{for(i=1;i<=NF;i++){if($i=="'$field'") print i}}}' $dbtable)
		  echo $fid
		  if [[ $fid == "" ]]
		  then
		    echo "Not Found"
		    tableMenu
		  else
		    echo -e "Enter Condition Value: \c"
		    read val
		    res=$(awk 'BEGIN{FS="|"}{if ($'$fid'=="'$val'") print $'$fid'}' $dbtable 2>>./.error.log)
		     if [[ $res == "" ]]
		      then
		      echo "Value Not Found"
		      tableMenu.sh
		    else
		      NR=$(awk 'BEGIN{FS="|"}{if ($'$fid'=="'$val'") print NR}' $dbtable 2>>./.error.log)
		      sed -i ''$NR'd' $tableName 2>>./.error.log
		      echo "Row Deleted Successfully"
		      tableMenu.sh
                   fi
                fi		
		tableMenu.sh
	fi
	
		
}






deleteRecord $tableName


