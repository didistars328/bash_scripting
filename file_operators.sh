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

echo -e "${GREEN}File operators:\n${RESTORE}`cat <<EOF
 -d FILE        True if file is a directory.
 -e FILE        True if file exists.
 -f FILE        True if file exists and is a regular file.
 -r FILE        True if file is readable by you.
 -s FILE        True if file exists and is not empty.
 -w FILE        True if the file is writable by you.
 -x FILE        True if the file is executable by you.
${GREEN}String operators:${RESTORE}
 -z STRING          True if string is empty.
 -n STRING          True if string is not empty.
 STRING             True if string is not empty.
 STRING1 = STRING2  True if the strings are equal.   
 STRING1 != STRING2 True if the strings are not equal.
${GREEN}Arithmetic operators:${RESTORE}   
 arg1 –eq arg2  True if arg1 is equal to arg2.   
 arg1 –ne arg2  True if arg1 is not equal to arg2.   
 arg1 –lt arg2  True if arg1 is less than arg2.   
 arg1 –le arg2  True if arg1 is less than or equal to  arg2.   
 arg1 –gt arg2  True if arg1 is greater than arg2.   
 arg1 –ge arg2  True if arg1 is greater than or equal to arg2.
EOF
`"

echo "${YELLOW}Usage:${RESTORE}"
cat <<EOF
[ condition-to-test-for ] && command1 || command2
EOF
echo "${BLUE}Example:${RESTORE}"
out='[ -e /etc/passwd ] && echo "File passwd exists" || echo "File passwd does not exist"'
echo "${out}"
echo "${GREEN}TEST:${RESTORE}"
eval "${out}"
