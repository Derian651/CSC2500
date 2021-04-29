#!/bin/bash
HI='\033[0;32m'
Normal='\033[0m'
echo -e "${HI}1. starts or ends with Jose$Normal"
grep -E '^Jose|Jose$' phonebook.dat
echo -e "${HI}2. contain at least twenty-seven upper or lower case characters a-z.$Normal"
grep -E '[a-z]{27,}' phonebook.dat
echo -e "${HI}3. consists of more than 18 characters. The character can be anything, including alphabetic and numeric.$Normal"
grep -E '.{18,}' phonebook.dat
echo -e "${HI}4. contains exactly 10 characters. The character can be anything, including alphabetic and numeric.$Normal"
grep -E '.{10}' phonebook.dat
echo -e "${HI}5. contains a sequence of between 6 and 8 alphabetic characters, i.e. upper or lower case a through z. The sequence must be separated from the rest of the line by a space or tab character (on each side)$Normal"
grep -E '^[ashi]{6,8}' phonebook.dat
echo -e "${HI}6. contains a local phone number: 3 digits, dash 4 digits$Normal"
grep -E '[^-][0-9]{3}-[0-9]{4}' phonebook.dat
echo -e "${HI}7. contains a valid URL on line by itself.$Normal"
grep -E '^(http|HTTP)://[w]{3}\.[a-zA-Z]+)\.[a-zA-Z]+)\.(com|edu)' phonebook.dat

