#!/bin/bash

read -p "Number of Columns: " colsNum

counter=1
sep="|"
rSep="\n"
pKey=""
metaData="Field$sep"Type$sep"key"
column_names=()  # Initialize an array to store column names

while [ $counter -le  $colsNum ]
do
  while true; do
    echo -e "Name of Column No.$counter: \c"
    read colName

    # Check if the column name already exists in the array
    if [[ " ${column_names[*]} " == *" $colName "* ]]; then
      echo "Column name '$colName' already exists. Please choose a different name."
    else
      # Add the column name to the array
      column_names+=("$colName")
      break  # Exit the loop if a unique column name is provided
    fi
  done

  echo -e "Type of Column $colName: "
  select var in "int" "str"
  do
    case $var in
      int ) colType="int"; break;;
      str ) colType="str"; break;;
      * ) echo "Wrong Choice" ;;
    esac
  done

  if [[ $pKey == "" ]]; then
    echo -e "Make PrimaryKey ? "
    select var in "yes" "no"
    do
      case $var in
        yes ) pKey="PK"
        metaData+=$rSep$colName$sep$colType$sep$pKey
        break;;
        no )
        metaData+=$rSep$colName$sep$colType$sep""
        break;;
        * ) echo "Wrong Choice" ;;
      esac
    done
  else
    metaData+=$rSep$colName$sep$colType$sep""
  fi

  if [[ $counter == $colsNum ]]; then
    temp=$temp$colName
  else
    temp=$temp$colName$sep
  fi

  ((counter++))
done

touch .$tableName
echo -e $metaData  >> .$1
touch $tableName
echo -e $temp >> $1

if [[ $? == 0 ]]
then
  echo "Table Created Successfully"
  . tableMenu.sh
else
  echo "Error Creating Table $tableName"
  . tableMenu.sh
fi
#!/bin/bash

read -p "Number of Columns: " colsNum

counter=1
sep="|"
rSep="\n"
pKey=""
metaData="Field$sep"Type$sep"key"
column_names=()  # Initialize an array to store column names

while [ $counter -le  $colsNum ]
do
  while true; do
    echo -e "Name of Column No.$counter: \c"
    read colName

    # Check if the column name already exists in the array
    if [[ " ${column_names[*]} " == *" $colName "* ]]; then
      echo "Column name '$colName' already exists. Please choose a different name."
    else
      # Add the column name to the array
      column_names+=("$colName")
      break  # Exit the loop if a unique column name is provided
    fi
  done

  echo -e "Type of Column $colName: "
  select var in "int" "str"
  do
    case $var in
      int ) colType="int"; break;;
      str ) colType="str"; break;;
      * ) echo "Wrong Choice" ;;
    esac
  done

  if [[ $pKey == "" ]]; then
    echo -e "Make PrimaryKey ? "
    select var in "yes" "no"
    do
      case $var in
        yes ) pKey="PK"
        metaData+=$rSep$colName$sep$colType$sep$pKey
        break;;
        no )
        metaData+=$rSep$colName$sep$colType$sep""
        break;;
        * ) echo "Wrong Choice" ;;
      esac
    done
  else
    metaData+=$rSep$colName$sep$colType$sep""
  fi

  if [[ $counter == $colsNum ]]; then
    temp=$temp$colName
  else
    temp=$temp$colName$sep
  fi

  ((counter++))
done

touch .$tableName
echo -e $metaData  >> .$1
touch $tableName
echo -e $temp >> $1

if [[ $? == 0 ]]
then
  echo "Table Created Successfully"
  . tableMenu.sh
else
  echo "Error Creating Table $tableName"
  . tableMenu.sh
fi

