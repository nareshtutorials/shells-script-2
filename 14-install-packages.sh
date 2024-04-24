#!/bin/bash
USERID=$(id -u)
if [ $? -ne 0 ]
then
    echo "pls run the script with root access"
    exit 1 # if error comes simply exit
else
    echo "you are super user"

fi

echo "Install all packages:$@"