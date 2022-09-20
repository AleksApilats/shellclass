#!/bin/bash


# Is named "add-local-user.sh".

# Enforces that it be executed with superuser (root) privileges.  If the script is not executed with superuser privileges it will not attempt to create a user and returns an exit status of 1.

ROOT=UID
if [[ ${ROOT} -ne 0 ]]
then 
    echo "You have to run this script as root!"
    exit 1
fi

# Prompts the person who executed the script to enter the username (login), the name for person who will be using the account, and the initial password for the account.
 read -p "Please enter username of person who will use this account: " USERNAME 

 read -p "Please enter full name of person who will use this account: " FULLNAME 

 read -p "Please enter the password for the username: " PASSWORD

# Creates a new user on the local system with the input provided by the user.
useradd -c "${FULLNAME}" -m ${USERNAME} 

echo ${PASSWORD} | passwd --stdin ${USERNAME}

passwd -e ${USERNAME}

# Informs the user if the account was not able to be created for some reason.  If the account is not created, the script is to return an exit status of 1.

if [[ ${?} -ne 0 ]]
then
    echo "Script did not run successfully.  Please run it again and make sure that all fields are filled in."
    exit 1
fi

# Displays the username, password, and host where the account was created.  This way the help desk staff can copy the output of the script in order to easily deliver the information to the new account holder.

echo "Username:     $USERNAME"
echo "Full Name:    $FULLNAME"
echo "Pasword:      $PASSWORD"
echo "Server:       $HOSTNAME"