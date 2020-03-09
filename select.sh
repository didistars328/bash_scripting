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

echo "${GREEN}==============="
echo "#### SELECT #####"
echo "===============${RESTORE}"
echo
echo "${YELLOW}Usage:${RESTORE}"
cat <<EOF
select ITEM in [LIST]
do
  command1
  command2
  command3
done
EOF
echo "${BLUE}Example:${RESTORE}"
out='PS3="Enter a number: "

select character in Sheldon Leonard Penny Howard Raj
do
    echo "Selected character: $character"
    echo "Selected number: $REPLY"
    echo "Use CNTRL+C to exit"
done'
echo "${out}"
echo "${GREEN}TEST:${RESTORE}"
eval "${out}"