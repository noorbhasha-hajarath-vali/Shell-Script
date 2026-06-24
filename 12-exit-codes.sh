#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Use sudo to install package"
    exit 1
fi



VALIDATE () {
    dnf install $1 -y

    if [ $? -ne 0 ]; then
        echo "ERROR:: $1 package installation failed"
        exit 1
    else
        echo "SUCCESS:: $1 package installed successfully"
    fi
}

VERIFY () {
    if [ dnf list installed $2 -ne 0 ]; then
        VALIDATE $2
    else
        echo "SKIPPED:: $2 is already installed"
    fi
}

VERIFY tree
VERIFY whois
VERIFY telnet