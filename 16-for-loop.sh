#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "User doesn't have root privilages, Run with sudo"
    exit 1
fi

dnf install tree -y

if [ $? -ne 0 ]; then
    echo "ERROR:: tree package installation Failed"
else
    echo "SUCCESS:: tree package installed Successfully"
fi

dnf install jq-devel -y

if [ $? -ne 0 ]; then
    echo "ERROR:: jq-devel package installation Failed"
else
    echo "SUCCESS:: jq-devel package installed Successfully"
fi

dnf install 7zip -y

if [ $? -ne 0 ]; then
    echo "ERROR:: 7zip package installation Failed"
else
    echo "SUCCESS:: 7zip package installed Successfully"
fi