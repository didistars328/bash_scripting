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
echo "##### IF ######"
echo "===============${RESTORE}"
echo "${YELLOW}Usage:${RESTORE}"
cat <<EOF
if [ condition-true ]
then
  command 1
  command 2
  ...
fi
EOF
echo "${BLUE}Example:${RESTORE}"
out='MY_SHELL="bash"
if [ "$MY_SHELL" = "bash" ]
then
  echo "You seem to like the bash shell."
fi'
echo "${out}"
echo "${GREEN}TEST:${RESTORE}"
eval "${out}"
echo

echo "${GREEN}=================="
echo "### IF # ELSE ####"
echo "==================${RESTORE}"
echo "${YELLOW}Usage:${RESTORE}"
cat <<EOF
if [ condition-true ]
then
  command 1
  command 2
  ...
else
  command 3
  command 4
  ...
fi
EOF
echo "${BLUE}Example:${RESTORE}"
out='MY_SHELL="zsh"
if [ "$MY_SHELL" = "bash" ]; then
  echo "You seem to like the bash shell."
else
  echo "You do not seem to like the bash shell."
fi'
echo "${out}"
echo "${GREEN}TEST:${RESTORE}"
eval "${out}"
echo

echo "${GREEN}=================="
echo "### IF # ELIF ####"
echo "==================${RESTORE}"
echo "${YELLOW}Usage:${RESTORE}"
cat <<EOF
if [ condition-true ]
then
  command 1
  command 2
  ...
elif [ condition-true ]
then
  command 3
  command 4
  ...
else
  command 5
  command 6
  ...
fi
EOF
echo "${BLUE}Example:${RESTORE}"
out='MY_SHELL="zsh"
if [ "$MY_SHELL" = "bash" ]
then
  echo "You seem to like the bash shell."
elif [ "$MY_SHELL" = "zsh" ]
then
  echo "You seem to like the zsh shell."
else
  echo "You do not seem to like the bash or zsh shells."
fi'
echo "${out}"
echo "${GREEN}TEST:${RESTORE}"
eval "${out}"

