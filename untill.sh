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

echo "${GREEN}================="
echo "#### UNTILL #####"
echo "=================${RESTORE}"
echo "TThe until loop is used to execute a given"
echo "set of commands as long as the given condition evaluates to false"
echo
echo "${YELLOW}Usage:${RESTORE}"
cat <<EOF
until [CONDITION]
do
  command1
  command2
  command3
done
EOF
echo "${BLUE}Example:${RESTORE}"
out='counter=0
until [ $counter -gt 5 ]
do
  echo Counter: $counter
  ((counter++))
done'
echo "${out}"
echo "${GREEN}TEST:${RESTORE}"
eval "${out}"