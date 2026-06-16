#!/bin/bash

#echo "Enter Username -" - Same can write as below
#read USERNAME

read -p "Enter Username - " USERNAME

#echo "Enter Password -" -  - Same can write as below
#read -s PASSWORD

read -sp "Enter Password - " PASSWORD
echo

echo "Entered Username is - $USERNAME"
echo "Entered Username is - $PASSWORD"
