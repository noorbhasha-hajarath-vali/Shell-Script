#!/bin/bash

USERID=$(id -u)

if [$USERID -ne 0]; then
    echo "Failed:: Run script with SUDO privilages"
fi

dnf install tree -y

if [$? -ne 0 ]; then
    echo "Failed:: tree package installation failed"
else
    echo "Success:: tree package installed Successfully"
fi