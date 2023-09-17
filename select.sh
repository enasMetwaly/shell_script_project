function selectMenu {
  echo -e "\n\n+---------------Select Menu--------------------+"
  echo "| 1. Select All Columns of a Table              |"
  echo "| 2. Select Specific Column from a Table        |"
  echo "| 3. Back To Tables Menu                        |"
  echo "| 4. Exit                                       |"
  echo "+----------------------------------------------+"
  echo -e "Enter Choice: \c"
  read ch
  case $ch in
    1) selectAll ;;
    2) selectCol ;;
    3) clear; . tableMenu.sh ;;
    4) exit 0
      break;;
     
    *) echo " Wrong Choice " ; selectMenu;
  esac
}

function selectAll {
  echo -e "Enter Table Name: \c"
  read tName
  column -t -s '|' $tName 2>>./.error.log
  if [[ $? != 0 ]]
  then
    echo "Error Displaying Table $tName"
  fi
  selectMenu
}

function selectCol {
  echo -e "Enter Table Name: \c"
  read tName
  echo -e "Enter Column Number: \c"
  read colNum
  awk 'BEGIN{FS="|"}{print $'$colNum'}' $tName
  selectMenu
}

selectMenu
