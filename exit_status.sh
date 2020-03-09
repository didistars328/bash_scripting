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

echo "${GREEN}==========================================="
echo 'The special variable $? contains the return'
echo 'code of the previously executed command.'
echo "===========================================${RESTORE}"
echo
echo "${YELLOW}Usage:${RESTORE}"
cat <<EOF
command1
echo "$?"
EOF
echo "${BLUE}Example:${RESTORE}"
out='HOST="google.com"
RETURN_CODE=$?
ping -c 1 $HOST > /dev/null
if [ "$RETURN_CODE" -eq "0" ]
then
  echo "$HOST reachable."
else
  echo "$HOST unreachable."
fi'
echo "${out}"
echo "${GREEN}TEST:${RESTORE}"
eval "${out}"
echo
echo "${GREEN}========================================="
echo -e 'To use if statements with exit statuses,\nyou can use logical ANDs and ORs.\nThe double ampersand (&&) represents AND,\nwhile the double pipe (||) represents OR.'
echo -e 'The command following a semicolon ; will\nalways get executed, no matter if the\nprevious command failed or succeeded.'
echo "=========================================${RESTORE}"
echo
echo "${YELLOW}Usage:${RESTORE}"
echo "command1 && command2"
echo "command2${GREEN} will be executed if${RESTORE} command1 ${GREEN}has status ${RESTORE}0"
echo "command1 || command2"
echo "command2${GREEN} will be executed if${RESTORE} command1 ${GREEN}has been failure status${RESTORE}"
echo "command1 ; command2"
echo "command2${GREEN} will be executed even either ${RESTORE}command1 ${GREEN}has been failure or succeeded${RESTORE}"
echo "${BLUE}Example:${RESTORE}"
out='mkdir -p /tmp/bak && touch /tmp/bak/test.txt
cp test.txt /tmp/bak/ || cp /tmp/bak/test.txt "${PWD}"
ls -l "${PWD}"/test.txt ; cat <<< "Hello World!" > test.txt ; cat test.txt'
echo "${out}"
echo "${GREEN}TEST:${RESTORE}"
eval "${out}"
rm -rf "${PWD}"/test.txt
echo "${GREEN}========================================="
echo -e "You can control the exit status of your\nshell script by using the exit command."
echo "=========================================${RESTORE}"
echo
echo "${YELLOW}Usage:${RESTORE}"
cat <<EOF
command1
exit #
EOF
echo "${BLUE}Example:${RESTORE}"
out='HOST="google.com"
ping -c 1 $HOST > /dev/null
if [ "$?" -ne "0" ]
then
  echo "$HOST unreachable."
  exit 123
else
  echo "$HOST is reachable."
  exit 0
fi'
echo "${out}"
echo "${GREEN}TEST:${RESTORE}"
eval "${out}"