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

dnf install jq-devel -y

if [$? -ne 0 ]; then
    echo "Failed:: jq-devel package installation failed"
else
    echo "Success:: jq-devel package installed Successfully"
fi

dnf install 7zip -y

if [$? -ne 0 ]; then
    echo "Failed:: 7zip package installation failed"
else
    echo "Success:: 7zip package installed Successfully"
fi