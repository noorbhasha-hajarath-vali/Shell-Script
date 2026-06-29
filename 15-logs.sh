#!/bin/bash

USERID=$(id -u)
LOG_DIR=/var/log/shell-script
mkdir -p $LOG_DIR
SCRIPT_NAME=$(basename "$0" .sh)
LOG_FILE="$LOG_DIR/$SCRIPT_NAME.log"

echo "Script started executing at $(date)" &>> $LOG_FILE

if [ $USERID -ne 0 ]; then
    echo "Failed:: Run script with SUDO privilages" &>> $LOG_FILE
    exit 1
fi

VALIDATE () {
    dnf install $1 -y &>> $LOG_FILE

    if [ $? -ne 0 ]; then
        echo "Failed:: $1 package installation failed" &>> $LOG_FILE
        exit 1
    else
        echo "Success:: $1 package installed Successfully" &>> $LOG_FILE
    fi
}

VERIFY () {
    dnf list installed $1 &>> $LOG_FILE

    if [ $? -ne 0 ]; then
        VALIDATE $1 &>> $LOG_FILE
    else
        echo "SKIPPED:: $1 package is already installed" &>> $LOG_FILE
    fi
}

VERIFY tree
VERIFY jq-devel
VERIFY 7zip