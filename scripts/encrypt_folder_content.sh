#1/bin/bash
# Version 1.0
# Autamated script to symmetrically encrypt the content of a given folder with a provided password.

# $1 = File Path


# Request Password
echo -n Password: 
read -s password

for file in $1/*
do
 md5="" #`md5sum ${file}`
 echo "Processing: $file, Checksum : $md5"
 gpg --quiet --yes --batch --passphrase "$password" -c "$file"
 echo "Removing $file"
 rm -f "$file"
done

ts=$(date +%s)
echo "Password will be backup in : $ts.txt"
echo "$password" > $ts.txt
