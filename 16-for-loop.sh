#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOG_DIR=/var/log/shell-script
mkdir -p $LOG_DIR
SCRIPT_NAME=$(basename "$0" .sh)
LOG_FILE=$LOG_DIR/$SCRIPT_NAME.log

if [ $USERID -ne 0 ]; then
    echo "User doesn't have root privilages, Run with sudo"
    exit 1
fi

echo "Process started executing at $(date)" | tee -a $LOG_FILE

VALIDATE () {
    if [ $? -ne 0 ]; then
        echo -e "$R ERROR $N:: $1 package installation Failed" | tee -a $LOG_FILE
    else
        echo "$G SUCCESS $N:: $1 package installed Successfully" | tee -a $LOG_FILE
    fi
}

for package in $@
do
    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]; then
        dnf install $1 -y &>>$LOG_FILE
        VALIDATE $? $package
    else
        echo "$Y SKIPPING $N:: $package package already installed" | tee -a $LOG_FILE
    fi
done
