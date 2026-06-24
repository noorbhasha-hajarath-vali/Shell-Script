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



VALIDATE tree

VALIDATE whois

VALIDATE telnet