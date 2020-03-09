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
echo "## Wildcards ##"
echo "===============${RESTORE}"
echo -e "${GREEN}Main wildcards:\n${RESTORE}`cat <<EOF
 - * - matches zero or more characters (everything).
       May be used to specify any number of characters.
       It is typically used at the end of a root word,
       when it is referred to as "truncation."

 - ? - matches exactly one character.
       May be used to represent a single character,
       anywhere in the word.  It is most useful when
       there are variable spellings for a word, and
       you want to search for all variants at once.

 - [ ] - specifies a range. If you did m[a,o,u]m it can
         become: mam, mum, mom if you did: m[a-d]m it can
         become anything that starts and ends with m and
         has any character a to d inbetween.

 - [!] - this construct is similar to the [ ] construct.
         This is a logical NOT.

 - \ - (backslash) is used as an "escape" character,
       i.e. to protect a subsequent special character.
       Ex: if you want to match all the files that end
       with a question mark, then use *\?.

 - { } - terms are separated by commas and each term must
         be the name of something or a wildcard.
         This wildcard will copy anything that matches either
         wildcard(s), or exact name(s) (an “or” relationship, one or the other)
         ${LRED}Note:${RESTORE} that spaces are not allowed after the commas (or anywhere else).
EOF
`"
echo "${BLUE}Example:${RESTORE}"
out='echo "${GREEN}Please create 3 different files with different names ${RED}(hit space between)${RESTORE}: ${YELLOW}"
read  nam1 nam2 nam3
echo "${RESTORE}`touch ${nam1}.txt ${nam2}.txt ${nam3}.txt test-${nam1}.txt test-${nam2}.txt test-${nam3}.txt test1.txt test2.txt test3.txt tost.txt tast.txt tist.txt t?st.txt`"
# Examples below:
ls *.txt;ls t*.txt
ls ?.txt;ls test?.txt
ls t[a-z]st.txt
ls t\?st.txt
ls test-[!${nam3}].txt
echo "All txt files in $PWD were removed using {} `rm -r {?.txt,t?st.*,test-*,test[1-9].txt}`"
ls -l'
echo "${out}"
echo "${GREEN}TEST:${RESTORE}"
eval "${out}"
echo "${GREEN}==================="
echo "Regular Expressions"
echo "===================${RESTORE}"
echo -e "${GREEN}Main expressions:\n${RESTORE}`cat <<EOF
${LRED}Note:${RESTORE} Regular Expressions are used by grep (and can be used) by find and many other programs.

 - . - will match any single character, equivalent to ?
       (question mark) in standard wildcard expressions.

 - .* - is used to match any string, equivalent to * in standard wildcards.

 - * - the proceeding item is to be matched zero or more times.
       ie. n* will match n, nn, nnnn, nnnnnnn but not na or any other character.

 - ^ - means "the beginning of the line". So "^a" means
       find a line starting with an "a".

 - $ - means "the end of the line". So "a$" means find a
       line ending with an "a"

 - | - This wildcard makes a logical OR relationship between wildcards.

 - [^] - This is the equivalent of [!] in standard wildcards.
         This performs a logical “not”.
EOF
`"
echo "${BLUE}Example:${RESTORE}"
echo "Enter anything you like ${RED}(use Cntl+D to close carret)${RESTORE}"
echo "${RED}Be aware that${RESTORE} 'grep "^s.*n$"'${RED} will be runnung in your input${RESTORE}"
cat  > test.txt
out='RES=$(cat test.txt | grep "^s.*n$")
[ "$?" -eq "0" ] && echo "Searching line was found - ${RES}" || echo "Searching line was not found - empty"'
echo "${out}"
echo "${GREEN}TEST:${RESTORE}"
eval "${out}"
rm -rf test.txt
echo "${GREEN}==============="
echo "## Categories ##"
echo "===============${RESTORE}"
echo -e "${GREEN}Main categories:\n${RESTORE}`cat <<EOF
 - [:upper:] - uppercase letters
 - [:lower:] - lowercase letters
 - [:alpha:] - alphabetic (letters) meaning upper+lower (both uppercase and lowercase letters)
 - [:digit:] - numbers in decimal, 0 to 9
 - [:alnum:] - alphanumeric meaning alpha+digits (any uppercase or lowercase letters or any decimal digits)
 - [:space:] - whitespace meaning spaces, tabs, newlines and similar
 - [:graph:] - graphically printable characters excluding space
 - [:print:] - printable characters including space
 - [:punct:] - punctuation characters meaning graphical characters minus alpha and digits
 - [:cntrl:] - control characters meaning non-printable characters
 - [:xdigit:] - characters that are hexadecimal digits.
EOF
`"
echo "${BLUE}Example:${RESTORE}"
out='touch eX1.txt eX2.txt eX3.txt
ls -l | grep "[[:upper:]][[:digit:]]"
rm -r e[[:upper:]][[:digit:]].txt'
echo "${out}"
echo "${GREEN}TEST:${RESTORE}"
eval "${out}"