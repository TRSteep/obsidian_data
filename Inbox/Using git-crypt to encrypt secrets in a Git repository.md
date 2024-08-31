#git #crypt #software 

# Windows
## Git App
- [Git application](Git%20application.md)

## Gpg4win
- https://gpg4win.org/download.html
- Run kleopatra

## Git-crypt
- https://github.com/AGWA/git-crypt
- https://github.com/AGWA/git-crypt/releases
### Install Git-crypt
- cmd as Administrator
- Browse to the location where you wish to install Git-crypt
	- `cd PATH`
```bash
git clone https://github.com/AGWA/git-crypt.git
cd git-crypt
make
make install
```

### Alternative way to install
- https://stackoverflow.com/questions/43040370/how-to-install-git-crypt-on-windows
	- Install msys2 http://www.msys2.org/
	- Open a msys2 terminal
	- Install g++
		- https://github.com/orlp/dev-on-windows/wiki/Installing-GCC--&-MSYS2
	- Be sure /mingw64/bin is in your path
	- git clone git@github.com:AGWA/git-crypt
	- cd git-crypt
	- make LDFLAGS="-static-libstdc++ -static -lcrypto -lws2_32"

### Set up Git-crypt
- Go to your Git repository
- `git-crypt init`
- create a .gitattributes file with the following contents
	- `* filter=git-crypt diff=git-crypt`
- Encrypt the files you want to protect
	- `git-crypt add-gpg-user <key-id>`
		- <Key-id> should be replaced with the ID of the GPG key you want to use to encrypt the files

# Linux
- Install
	- `apt-get install git-crypt gpg`
- Repo
	- Create Repo
		- new Git repository somewhere like github
	- Clone Repo
		- `git clone git@gitlab.com:me/git-crypt-demo.git`
	- `cd git-crypt-demo`
	- Init Repo
		- `git-crypt init`
	- Prepare to crypt
		- symetric key will be generated here
			- `.git/git-crypt/keys/default`
		- Create a base64 encoded version of your key
			- `cat .git/git-crypt/keys/default | base64 > git-grypt.key`
		- Create file ‘secret.txt’ with the text
			- `echo "my secret txt" > secret.txt`
		- Create file .gitattributes with a filter matching our secret file
			- `echo "secret.txt filter=git-crypt diff=git-crypt" > .gitattributes`
		- Let’s see the status
			- `git-crypt status`
		- git add
			- `git add .gitattributes secret.txt`
			- `git commit -a -m "Added encrypted secret`
			- `git push`
		- Go to the webinterface for the repository, and look at the file ‘secret.txt’. The content should be encrypted