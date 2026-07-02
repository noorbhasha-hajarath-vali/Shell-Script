#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "User doesn't have root privilages, Run with sudo"
    exit 1
fi

VALIDATE () {
    dnf install $1 -y

    if [ $? -ne 0 ]; then
        echo "ERROR:: $1 package installation Failed"
    else
        echo "SUCCESS:: $1 package installed Successfully"
    fi
}


VALIDATE tree
VALIDATE jq-devel
VALIDATE 7zip

