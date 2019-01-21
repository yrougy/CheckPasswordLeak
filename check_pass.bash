#!/usr/bin/env bash


URL="https://api.pwnedpasswords.com/range/"
case $(uname -s) in
	Linux) HASH=sha1sum;;
	Darwin) HASH=shasum;;
	*BSD) HASH=shasum;;
	*) HASH=sha1sum;;
esac


echo -n "Enter password to check: "
read -s PASS 
echo

SHA1PASS=$(echo -n "$PASS" | "$HASH" | cut -d ' ' -f 1 | tr '[a-f]' '[A-F]')
PASS=''
HEADSHA="${SHA1PASS:0:5}"
TAILSHA="${SHA1PASS:5:39}"

REQUEST="${URL}${HEADSHA}"
if  CHECK=$(curl -s "$REQUEST" | grep "$TAILSHA") 
then 
	echo $CHECK | cut -d : -f 2 | xargs echo Found occurences:
else
	echo "Not found in haveibeenpwned.com database"
fi
