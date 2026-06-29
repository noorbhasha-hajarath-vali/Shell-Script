#!/bin/bash

USERID=$(id -u)
LOG_DIR=/var/log/shell-script
mkdir -p $LOG_DIR
SCRIPT_NAME=$(basename "$0" .sh)
LOG_FILE="$LOG_DIR/$SCRIPT_NAME.log"

if [ $USERID -ne 0 ]; then
    echo "Failed:: Run script with SUDO privilages"
    exit 1
fi

echo "Script started executing at $(date)" | tee -a $LOG_FILE

VALIDATE () {
    dnf install $1 -y &>> $LOG_FILE

    if [ $? -ne 0 ]; then
        echo "Failed:: $1 package installation failed" | tee -a $LOG_FILE
        exit 1
    else
        echo "Success:: $1 package installed Successfully" | tee -a $LOG_FILE
    fi
}

VERIFY () {
    dnf list installed $1 &>> $LOG_FILE

    if [ $? -ne 0 ]; then
        VALIDATE $1 | tee -a $LOG_FILE
    else
        echo "SKIPPED:: $1 package is already installed" | tee -a $LOG_FILE
    fi
}

VERIFY tree
VERIFY jq-devel
VERIFY 7zip