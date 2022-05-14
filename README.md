# CheckPasswordLeak


This small script check if the entered password is in the HaveIBeenPwned password database.

I wrote this script for my own use, and to be sure the password I test is never sent directly to a server.

It requires
- OSX/Darwin/MacOS: the shasum executable
- GNU/Linux: the sha1sum executable
- FreeBSD: the shasum executable

- Python3: only needs requests module

- All: the curl executable
