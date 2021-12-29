#! /bin/sh
# Convenience script to set up admin id/pw

DIRNAME=`dirname "$0"`

read -p "Enter the admin account: " adminId
read -p "Enter the admin password: " -s adminPw

$DIRNAME/add-user.sh -a -dc $DIRNAME/../standalone/configuration -g admin $adminId $adminPw
