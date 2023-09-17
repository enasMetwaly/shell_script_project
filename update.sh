 #!/bin/bash
 read -p "Enter Table Name: \c" tName

 


function typeofvar {
    local var=$1
    if [[ -z "$var" ]]; then
        echo "empty"
    elif [[ "$var" =~ ^-?[0-9]+$ ]]; then
        echo "integer"
    elif [[ "$var" =~ ^-?[0-9]+\.?[0-9]*$ ]]; then
        echo "float"
    else
        echo "string"
    fi
}


updateTable () {
     local tName="$1"

     
break_loop=0
while [ "$break_loop" -eq 0 ]; do   
  if ! [  -f "$tName" ]; then
    echo "Table $tName doesn't exist."
    echo "Please enter another table: "
    read new_table
    tName="$new_table"
  else
    break_loop=1
    break
  fi
done



 read -p "Enter Condition Column name: \c" field

  fid=$(awk 'BEGIN{FS="|"}{if(NR==1){for(i=1;i<=NF;i++){if($i=="'$field'") print i}}}' $tName)
  if [[ $fid == "" ]]
  then
    echo "Not Found"
    tableMenu.sh
  else
     
    echo -e "Enter Condition Value: \c"
    read val
    res=$(awk 'BEGIN{FS="|"}{if ($'$fid'=="'$val'") print $'$fid'}' $tName 2>>./.error.log)
    if [[ $res == "" ]]
    then
      echo "Value Not Found"
      
      tableMenu.sh
    else
      echo -e "Enter FIELD name to set: \c"
      read setField
      setFid=$(awk 'BEGIN{FS="|"}{if(NR==1){for(i=1;i<=NF;i++){if($i=="'$setField'") print i}}}' $tName)
      if [[ $setFid == "" ]]
      then
        echo "Not Found"
        tableMenu
      else
        echo -e "Enter new Value to set: \c"
        read newValue
        NR=$(awk 'BEGIN{FS="|"}{if ($'$fid' == "'$val'") print NR}' $tName 2>>./.error.log)
        oldValue=$(awk 'BEGIN{FS="|"}{if(NR=='$NR'){for(i=1;i<=NF;i++){if(i=='$setFid') print $i}}}' $tName 2>>./.error.log)
        echo $oldValue
        oldValue_datatype=$(typeofvar "$oldValue")
        echo "The datatype of oldValue is: $oldValue_datatype"
        newValue_datatype=$(typeofvar "$newValue")
        echo "The datatype of oldValue is: $newValue_datatype"


  exitflag=0

  while [ "$exitflag" -eq 0 ]; do
  if [ "$newValue_datatype" != "$oldValue_datatype" ]; then
    echo "The data types of oldValue and newValue are different."
    echo "Please enter the correct data type"
    echo -e "Enter new Value to set: "
    read newValue2
    newValue_datatype=$(typeofvar "$newValue2")
     else
    exitflag=1
    break
   fi
   done

           sed -i ''$NR's/'$oldValue'/'$newValue2'/g' $tName 2>>./.error.log
           echo "Row Updated Successfully"
           tableMenu.sh
      fi
    fi
  fi
}

updateTable $tName 


















        




