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
        echo -e "${R}ERROR${N}:: $package package installation Failed"
        echo "ERROR$:: $package package installation Failed" &>> $LOG_FILE
    else
        echo -e "${G}SUCCESS${N}:: $package package installed Successfully"
        echo "SUCCESS:: $package package installed Successfully" &>> $LOG_FILE 
    fi
}

for package in $@
do
    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]; then
        dnf install $package -y &>>$LOG_FILE
        VALIDATE $? $package
    else
        echo -e "${Y}SKIPPING${N}:: $package package already installed"
        echo "SKIPPING:: $package package already installed" &>> $LOG_FILE
    fi
done
