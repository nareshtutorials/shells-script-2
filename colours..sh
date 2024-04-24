#!/bin/bash
USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
y="\e[33m"

echo "script started executed at:$TIMESTAMP"

VALIDATE(){
    if [ $1 -ne 0 ] 
    then
        echo -e "$2...$R Failure $N"
        exit 1
    else
        echo -e  "$2...$G SUCCESS $N"
    
    fi
}

if [ $USERID -ne 0 ]
then
    echo "pls run the script with root access"
else
    echo "you are super user"
fi

dnf install mysql -y &>>$LOGFILE
VALIDATE $? "Installing mysql"

dnf install git -y &>>$LOGFILE
VALIDATE $? "Installing Git"


