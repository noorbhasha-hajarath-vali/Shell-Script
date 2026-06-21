#!/bin/bash

read -p "Enter Marks: " MARKS

if [ $MARKS -gt 60 ]; then
    echo "You passed in 1st Class with the marks: $MARKS"
elif [ $MARKS -gt 30 ]; then
    echo "You passed in 2nd Class with the marks: $MARKS"
else
    echo "Failed with the marks $MARKS"
fi