  read  -p "Table Name: \c" tableName
 insert() {
   local tableName="$1"

  break_loop=0
while [ "$break_loop" -eq 0 ]; do   
  if [ ! -f "$tableName" ]; then
    echo "Table $tableName doesn't exist."
    echo "Please enter another table: "
    read new_table
    tableName="$new_table"
  else
    break_loop=1
    break
  fi
done  
  colsNum=`awk 'END{print NR}' .$tableName`
  sep="|"
  rSep="\n"
  for (( i = 2; i <= $colsNum; i++ )); do
    colName=$(awk 'BEGIN{FS="|"}{ if(NR=='$i') print $1}' .$tableName)
    colType=$( awk 'BEGIN{FS="|"}{if(NR=='$i') print $2}' .$tableName)
    colKey=$( awk 'BEGIN{FS="|"}{if(NR=='$i') print $3}' .$tableName)
    echo -e "$colName ($colType) = \c"
    read data

    # Validate int Input
    if [[ $colType == "int" ]]; then
      while ! [[ $data =~ ^[0-9]*$ ]]; do
        echo -e "invalid DataType !!"
        echo -e "$colName ($colType) = \c"
        read data
      done
    fi
    #validate string Input
    if [[ $colType == "str" ]]; then
    	while [[ true ]]; do
	    if [[ "$data" =~ [^a-zA-Z] ]]; then
		echo "Input contains numbers."
		echo -e "invalid DataType !!"
		echo -e "$colName ($colType) = \c"
		read data
	    elif [[ "$data" =~ ^\|.*|\$ ]] || [[ "$input" =~ ^\$.*\|$ ]]; then
		echo "Input cannot start or end with the '|' symbol."
		 echo -e "invalid DataType !!"
		echo -e "$colName ($colType) = \c"
		read data
            else
               
        	  break;		
	   fi
      done
    fi
    
    
    #validate primary keu
    if [[ $colKey == "PK" ]]; then
      while [[ true ]]; do
        if [[ $data =~ ^[`awk 'BEGIN{FS="|" ; ORS=" "}{if(NR != 1)print $(('$i'-1))}' $tableName`]$ ]]; then
          echo -e "invalid input for Primary Key !!"
        else
          break;
        fi
        echo -e "$colName ($colType) = \c"
        read data
      done
    fi

    #Set row
    if [[ $i == $colsNum ]]; then
      row=$row$data$rSep
    else
      row=$row$data$sep
    fi
  done
  echo -e $row"\c" >> $tableName
  if [[ $? == 0 ]]
  then
    echo "Data Inserted Successfully"
  else
    echo "Error Inserting Data into Table $tableName"
  fi
  row=""
  tableMenu.sh
} 


 insert $tableName

