#!/bin/python3

import hashlib
import getpass
import requests

URL = 'https://api.pwnedpasswords.com/range/'

password_to_check = getpass.getpass(prompt=f'Enter password to check: ')

hash_sha1 = hashlib.new('sha1')
hash_sha1.update(password_to_check.encode('utf-8'))
password_hashed = hash_sha1.hexdigest().upper()

head_passord = password_hashed[0:5]
tail_passord = password_hashed[5:39]

r = requests.get(f'{URL}{head_passord}')
result = r.text

for line in result.splitlines():
    if tail_passord in line:
        print('Found occurences: ' + line.split(':')[1])
        exit()

print('Not found in haveibeenpwned.com database')
