#!/bin/bash

read -p "Enter Number: " NUMBER

if [ $(($NUMBER % 2)) -eq 0 ]; then
    echo "Given $NUMBER is EVEN Number"
else
    echo "Given $NUMBER is ODD Number"
fi