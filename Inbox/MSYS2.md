 #software #windows 

Software Distribution and Building Platform for Windows
Analogs
- [Installation system for windows](Installation%20system%20for%20windows.md)

# Installation
- Download the installer:
	- https://github.com/msys2/msys2-installer/releases/download/2024-07-27/msys2-x86_64-20240727.exe
- Installing MSYS2 requires 64 bit Windows 10 or newer
- Enter your desired Installation Folder
	- short ASCII-only path on a NTFS volume, no accents, no spaces, no symlinks, no subst or network drives, no FAT

# terminal for the UCRT64 environment will launch
- install some tools like the mingw-w64
	- `$ pacman -S mingw-w64-ucrt-x86_64-gcc`
- Now you can call gcc to build software for Windows
	- `gcc --version`