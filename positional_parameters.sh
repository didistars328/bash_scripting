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

echo "${GREEN}#########################################"
echo -e 'Positional Parameters are variables that\ncontain the contents of the command line.\nThese variables are $0 through $9.\n'
echo -e '$0 - a script itself\n$1 - parameter1\n$2 - parameter2\n...\n#########################################'${RESTORE}
echo
echo -e "${YELLOW}Usage: ${RESTORE}"
echo -e 'script.sh parameter1 parameter2 parameter3\n$0 - script.sh\n$1 - parameter1\n$2 - parameter2\n$3 - parameter3'
echo "${CYAN}PRACTICE${RESTORE}"
echo -e "${GREEN}Enter 3 different values ${RED}(hit space between)${GREEN}:${RESTORE}"
read -p "$0 ${YELLOW}"  nam1 nam2 nam3
echo -e ${RESTORE}'Here:\n$0 - this is script name\n$1 - your '${nam1}' entered value\n$2 - your '${nam2}' entered value\n$3 - your '${nam3}' entered value'
echo "${BLUE}Example:${RESTORE}"
out='set ${nam1}
PARAMETER=$1   
# The first parameter is the user.
echo "Executing script: $0"
echo "Showing a first entered value from PRACTICE - $PARAMETER"'
echo "${out}" | sed 1,1d
echo "${GREEN}TEST:${RESTORE}"
eval "${out}"
echo "${GREEN}#############################################"
echo -e 'You can access all the positional parameters\nstarting at $1 to the very last one on the\ncommand line by using the special variable $@'
echo "#############################################${RESTORE}"
echo "${BLUE}Example:${RESTORE}"
out='set ${nam1} ${nam2} ${nam3}
i=0
for PARAMETER in $@
do
  let "i++"
  echo "Showing a $i entered value from PRACTICE - $PARAMETER"
done'
echo "${out}" | sed 1,1d
echo "${GREEN}TEST:${RESTORE}"
eval "${out}"