#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Use sudo to install package"
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "ERROR:: Failed to Install"
else
    echo "SUCCESS:: mysql package installed successfully"
fi
