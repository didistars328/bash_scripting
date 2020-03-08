#!/bin/bash

RESTORE=$'\033[0m'

RED=$'\033[00;31m'
GREEN=$'\033[00;32m'
YELLOW=$'\033[00;33m'
BLUE=$'\033[00;34m'
PURPLE=$'\033[00;35m'
CYAN=$'\033[00;36m'
LIGHTGRAY=$'\033[00;37m'

LRED=$'\033[01;31m'
LGREEN=$'\033[01;32m'
LYELLOW=$'\033[01;33m'
LBLUE=$'\033[01;34m'
LPURPLE=$'\033[01;35m'
LCYAN=$'\033[01;36m'
WHITE=$'\033[01;37m'

echo "${GREEN}=============="
echo "## FUNCTION ##"
echo "==============${RESTORE}"
echo "${YELLOW}Usage:${RESTORE}"
cat <<EOF
function function-name () {
  # Code goes here.
}
or
function-name () {
  # Code goes here.  }
}

function-name
EOF
echo "${BLUE}Example:${RESTORE}"
out='function hello () {
echo "Hello!"
}

hello'
echo "${out}"
echo "${GREEN}TEST:${RESTORE}"
eval "${out}"
echo
echo "${GREEN}=============="
echo "### NESTED ###"
echo "==============${RESTORE}"
echo "${YELLOW}Usage:${RESTORE}"
cat <<EOF
function-name_1 () {
  # Code goes here.
  function-name_2
}

function-name_2 () {
  # Code goes here.
}

function-name_1
EOF
echo "${LRED}You cannot call main function before nested!${RESTORE}"
echo "${BLUE}Example:${RESTORE}"
out='hello () {
echo "Hello!"
now
}

now () {
echo "It is $(date +%r)"
}

hello'
echo "${out}"
echo "${GREEN}TEST:${RESTORE}"
eval "${out}"
echo
echo -e "${GREEN}Functions mainly use 2 types of vars:\n${YELLOW}-LOCAL${RESTORE} - works only within function\n${YELLOW}-GLOBAL${RESTORE} - usual vars, works outside and within function."
echo "${YELLOW}Usage:${RESTORE}"
cat <<EOF
function-name_1 () {
  # Code goes here.
  local VAR=var
}

function-name
EOF
echo "${BLUE}Example:${RESTORE}"
out='backup_file () {
if [ -f "$1" ]
then
  local BACKUP_FILE="/var/tmp/$(basename ${1}).$(date +%F).$$"
  echo "Backing up $1 to ${BACKUP_FILE}"
  cp $1 $BACKUP_FILE
fi
}

backup_file /etc/hosts'
echo "${out}"
echo "${GREEN}TEST:${RESTORE}"
eval "${out}"
echo
echo -e "${GREEN}Functions are using return statement and following them\nwith the status you would like to return.${RESTORE}"
cat <<EOF
function-name_1 () {
  # Code goes here.
  return #
}

function-name
EOF
echo "${BLUE}Example:${RESTORE}"
out='backup_file () {
if [ -f "$1" ]
then
  local BACKUP_FILE="/var/tmp/$(basename ${1}).$(date +%F).$$"
  echo "Backing up $1 to ${BACKUP_FILE}"
  cp $1 $BACKUP_FILE
else
  # The file does not exist, so return
  # a non-zero exit status.
  return 1
fi
}

backup_file /etc/hosts
if [ $? -eq "0" ]
then
  echo "Backup succeeded!"
else
  echo "Backup failed!"   
  #Abort the script and return a non-zero status.   
  exit 1
fi'
echo "${out}"
echo "${GREEN}TEST:${RESTORE}"
eval "${out}"