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
echo "##### FOR ######"
echo "================${RESTORE}"
echo "${YELLOW}Usage:${RESTORE}"
cat <<EOF
for VARIABLE_NAME in ITEM_1 ITEM_2 ITEM_N
do   
  command 1   
  command 2
  ...
done
EOF
echo "${BLUE}Example:${RESTORE}"
out='COLORS="red green blue"
for COLOR in $COLORS
do
  echo "COLOR: $COLOR"
done'

echo "${out}"
echo "${GREEN}TEST:${RESTORE}"
eval "${out}"
echo
echo "${CYAN}PRACTICE 1${RESTORE}"
echo "${GREEN}Please create 3 different files with different names ${RED}(hit space between): ${YELLOW}"
read  nam1 nam2 nam3;touch ${nam1}.txt ${nam2}.txt ${nam3}.txt
echo "${GREEN}Now let's change those names using code below: ${RESTORE}"
practice='FILES=$(ls *txt)
DATE=$(date +%F)
for FILE in $FILES
do
  echo "Renaming ${FILE} to ${DATE}-${FILE}"
  mv ${FILE} ${DATE}-${FILE}
done'
echo "${practice}"
echo "${GREEN}Now run this code..."
read -p "Pres ${YELLOW}[ ENTER ]"${RESTORE};
eval "${practice}"
rm -rf *${nam1}.txt *${nam2}.txt *${nam3}.txt