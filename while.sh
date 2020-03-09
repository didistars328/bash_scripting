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

echo "${GREEN}================"
echo "#### WHILE #####"
echo "================${RESTORE}"
echo "The while loop is used to performs a given"
echo "set of commands an unknown number of times as"
echo "long as the given condition evaluates to true"
echo
echo "${YELLOW}Usage:${RESTORE}"
cat <<EOF
while [ condition ]
do
   command1
   command2
   command3
done
EOF
echo "${BLUE}Example:${RESTORE}"
out='x=1
while [ $x -le 5 ]
do
  echo "Welcome $x times"
  x=$(( $x + 1 ))
done'
echo "${out}"
echo "${GREEN}TEST:${RESTORE}"
eval "${out}"
echo "${GREEN}In while loops often using 2 commands:${RESTORE}"
echo " - break - to stop loop"
echo " - continue - to continue loop"
echo "${BLUE}Example:${RESTORE}"
out='i=0
while [ $i -lt 5 ]
do
  echo "Number: $i"
  ((i++))
  if [[ "$i" == "2" ]]; then
     echo "i has reached 2"
     continue
  elif [[ "$i" == "4" ]]; then
     break
  fi
done'
echo "${out}"
echo "${GREEN}TEST:${RESTORE}"
eval "${out}"
echo
echo  "${LRED}Note:${RESTORE}${GREEN} To read a file by line while loop it's a good choise.${RESTORE}"
echo "${BLUE}Example:${RESTORE}"
out='file=/etc/passwd
i=0
while IFS= read -r line; do
  echo $line
  if [[ $i -ne 10 ]];then
      ((i++))
      continue
  else
      break
  fi
done < <(tail -n +20 "$file")

# By default, the read command trims the leading/trailing
# whitespace characters (spaces and tabs).
# Use the IFS= option before read to prevent this behavior'
echo "${out}"
echo "${GREEN}TEST:${RESTORE}"
eval "${out}"
