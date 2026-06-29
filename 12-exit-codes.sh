#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR:: Use sudo to install package"
    exit 1
fi

dnf install tree -y

if [ $? -ne 0 ]; then
    echo "ERROR:: tree package installation failed"
    exit 1
else
    echo "SUCCESS:: tree package installed successfully"
fi
