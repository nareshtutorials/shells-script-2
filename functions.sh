#!/bin/bash
USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT-NAME=$($0 | cut -d "." -f1)
LoGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log


VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2...FAILURE"
        exit 1
    else
        echo "$2 ...SUCCESS"
    fi
}

if [ $USERID -ne 0 ]

then
    echo "please run this script with root access"

exit 1 # manually exit if error comes
else
    echo "you are superuser."
fi

dnf install mysql -y &>>$LOOGFILE
VALIDATE $? "Installing MySQL"

dnf install git -y
VALIDATE $? "Installing Git"

