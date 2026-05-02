#!/bin/bash

# user_audit.sh
# Audits local Linux users from /etc/passwd.

echo "===== Local User Audit ====="
echo

echo "Users with login shells:"
echo "------------------------"

awk -F: '$7 !~ /(nologin|false)$/ {print "User: " $1 " | UID: " $3 " | Home: " $6 " | Shell: " $7}' /etc/passwd

echo
echo "System/service accounts:"
echo "------------------------"

awk -F: '$3 < 1000 {print "User: " $1 " | UID: " $3 " | Shell: " $7}' /etc/passwd

echo
echo "Regular user accounts:"
echo "----------------------"

awk -F: '$3 >= 1000 && $3 < 65534 {print "User: " $1 " | UID: " $3 " | Home: " $6 " | Shell: " $7}' /etc/passwd

echo
echo "Audit complete."
