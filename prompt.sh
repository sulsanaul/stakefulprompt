#!/bin/bash

echo "Enter the location of a file or directory to stake, you sad coward:"
read path
if ! [ -e $path ]; then 
    echo "Liar. No such file or directory."
    exit 1
fi
filesize=$(wc -c $path | awk '{print $1}')

echo "You are staking $filesize bytes of data. Proceed? (y/n)"
read proceed

if [ $proceed == "y" ]; then 
    echo "PROMPT — $(cat prompt.txt)"
    read response
    answer="$(cat answer.txt)"
    if [ "$response" == "$answer" ]; then 
        echo "FEEDBACK — Correct. No data has been removed."
    else 
        echo "FEEDBACK — That's not right, Fool. The answer is: $answer."
        echo "Removing data at $path..."
        rm $path 
        echo "$filesize bytes removed."
    fi

else 
    echo "Aborted."
fi