#!/bin/bash

#This script generates a list of random passwords

PASSWORD="${RANDOM}"
echo "$PASSWORD"

# Three random numbers together
PASSWORD="${RANDOM}${RANDOM}${RANDOM}"
echo "${PASSWORD}"

# Set password to date +%s epoch time in force user to change it on first login in seconds
PASSWORD=$(date +%s)
echo ${PASSWORD}

# Use nanoseconds to act as randomisation
PASSWORD=$(date +%s%N)
echo ${PASSWORD}

# A better password randomisation
PASSWORD=$(date +%s%N | sha256sum | head -c 32)
echo ${PASSWORD}

# Even stronger password randomisation 
PASSWORD=$(date +%s%N${RANDOM}${RANDOM} | sha256sum | head -c 42)
echo ${PASSWORD}

#Append special character to the password
SPECIAL_CHARACTER=$(echo '!@#$%^&*()_-+=' | fold -w1 | shuf | head -c1)
echo "${PASSWORD}${SPECIAL_CHARACTER}"