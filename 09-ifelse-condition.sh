#!/bin/bash

read -p "Enter Marks: " MARKS

if [ $MARKS -le 30 ]; then
    echo "FAIL, You got $MARKS"
else
    echo "PASS, You got $MARKS"
fi