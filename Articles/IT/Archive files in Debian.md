#linux #debian 

- All in one
	- Unarchive
		- `atool -x shell.zip`
		- `atool -x shell.tar.gz`
		- `atool -x shell.7z`
		- `atool -x shell.rar`
	- Archive
		- `atool -a -e -F .tar.gz shell`
		- `atool -a -e -F .zip shell`
		- `atool -a -e -F .7z shell`
		- `atool -a -e -F .rar shell`
- TAR
	- Unarchive
		- `tar -xjf package.tar.bz2`
		- `tar -xzf package.tar.gz`
		- `tar xvzf LinuxGuestTools-8.3.0-1.tar.gz -C /tmp/GuestTool/`
	- Archive
		- `tar -cf archive.tar file1 file2 file3`
		- `tar -czf archive.tar.gz file1 file2`
- ZIP
	- `sudo apt install unzip`
	- Unarchive
		- `unzip FILE.zip`
		- `unzip -P PasswOrd FILE.zip`
		- `unzip FILE.zip -d /tmp/PATHTOFOLDER`
	- Archive
		- `zip -r FILE.zip FOLDER/`
- 