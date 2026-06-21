#!/bin/bash

read -p "Enter Marks: " MARKS

if [ $MARKS -gt 29 ]; then
    echo "$MARKS are very less, FAILED"
fi