#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Failed:: Run script with SUDO privilages"
    exit 1
fi

VALIDATE () {
    dnf install $1 -y

    if [ $? -ne 0 ]; then
        echo "Failed:: $1 package installation failed"
        exit 1
    else
        echo "Success:: $1 package installed Successfully"
    fi
}

VERIFY () {
    dnf list installed $1

    if [ $? -ne 0 ]; then
        VALIDATE $1
    else
        echo "SKIPPED:: $1 package is already installed"    
    fi
}

VERIFY tree
VERIFY jq-devel
VERIFY 7zip