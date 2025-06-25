#!/bin/bash

cmd=$1
file=$2

case $cmd in

  addLineTop)
    line="$3"
    echo "$line" | cat - "$file" > temp && mv temp "$file"
    ;;

  addLineBottom)
    line="$3"
    echo "$line" >> "$file"
    ;;

  addLineAt)
    lineno=$3
    line="$4"
    awk -v n="$lineno" -v text="$line" 'NR==n{print text} {print}' "$file" > temp && mv temp "$file"
    ;;

  updateFirstWord)
    old=$3
    new=$4
    sed -i "0,/$old/s//$new/" "$file"
    ;;

  updateAllWords)
    old=$3
    new=$4
    sed -i "s/$old/$new/g" "$file"
    ;;

  insertWord)
    w1=$3
    w2=$4
    insert=$5
    sed -i "s/$w1/$w1 $insert $w2/g" "$file"
    ;;

  deleteLine)
    # Check for word in argument
    if [ $# -eq 4 ]; then
      word=$4
      sed -i "$3{
        /$word/d
      }" "$file"
    else
      sed -i "$3d" "$file"
    fi
    ;;

  *)
    echo "❌ Invalid command. Try: addLineTop, addLineBottom, addLineAt, updateFirstWord, updateAllWords, insertWord, deleteLine"
    echo "./otTextEditor addLineTop myfile.txt "Hello at the top" "
echo "./otTextEditor addLineBottom myfile.txt "This goes last" "
echo "./otTextEditor addLineAt myfile.txt 3 "Inserted at line 3" "
echo "./otTextEditor updateFirstWord myfile.txt oldword newword "
echo "./otTextEditor updateAllWords myfile.txt old new "
echo "./otTextEditor insertWord myfile.txt apple orange MANGO "
echo "./otTextEditor deleteLine myfile.txt 2 "
echo "./otTextEditor deleteLine myfile.txt 4 hello "

    ;;
esac

