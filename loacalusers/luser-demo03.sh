#!/bin/bash

# Display the UID and username of the user excuting this script
# Display if user is the vagrant or not

# Display the UID
echo "Your UID is ${UID}"

# Only display if the UID does NOT match 100
#DRY do not repeat yourself write one variable and use it many times. Then just change it
# help test has explanation -ne option not equal
UID_TO_TEST_FOR='1000'
if [[ "${UID}" -ne "${UID_TO_TEST_FOR}" ]]
then 
    echo "Your UID is does not match  ${UID_TO_TEST_FOR}"
    exit 1
fi

# Display the username
USER_NAME=$(id -un)


# Test if command succeeded
if [[ ${?} -ne 0 ]]
then 
    echo "The id command did not execute successfully."
    exit 1
fi
echo "Your username is ${USER_NAME}"


# You can use a string test conditional

USER_NAME_TO_TEST_FOR='vagrant'
if [[ "${USER_NAME}" == "${USER_NAME_TO_TEST_FOR}" ]]
    then
    echo "Your username matches ${USER_NAME_TO_TEST_FOR}"
fi


# Test for != (not equal) for the string
if [[ "${USER_NAME}" != "${USER_NAME_TO_TEST_FOR}" ]]
    then
    echo "Your username does not match ${USER_NAME_TO_TEST_FOR}"
    exit 1
fi

exit 0