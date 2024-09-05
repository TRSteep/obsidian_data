#windows #linux 

Info
- https://www.maketecheasier.com/improve-wsl-experience/

# Zsh

## Installing Zsh
```bash
sudo apt install zsh -y
```
## Installing Oh My Zsh 
```bash
sudo apt install curl git
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

## Configuring Zsh
```bash
nano ~/.zshrc
```
- ### Theme
	- choose one from this list
		- https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
		- some good themes that provide maximum legibility
			- bira
			- dst
			- fino-time
			- gnzh
	- change the value of ZSH_THEME to it
		- ![|450](wsl-zshtheme.png)
- ### Plugins
	- edit the line that starts with plugins to include all the plugins
		- https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins
	- most Linux environments
		- **git** - (already configured usually) – for easy aliases that make working with Git repositories easier
		- **sudo** - in case you forget to prepend your command with sudo, this automatically does it when you press the Esc key twice
		- python - 

## Installing Powerline Fonts for Zsh
```
https://github.com/powerline/fonts/archive/master.zip
Set-ExecutionPolicy Bypass
.\install.ps1
```

# Configuring WSL
## Limit Its CPU and Memory Usage
- Create a new file in your Windows home folder called .wslconfig from within WSL
	- `editor "$(wslpath "C:\Users\[Your Username]\.wslconfig")"`
		- Don’t forget to replace [Your Username] with your Windows username
```ini
[wsl2]
memory=2GB
processors=2
```
limit WSL’s memory usage to 2 GB and ensure that it uses no more than 2 CPU cores at a time
```powershell
wsl --shutdown
```

## Use Windows Git Credential Manager on WSL
To set your WSL’s Git to use Windows Git credential manager, run the following command in your WSL terminal:
```powershell
git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/libexec/git-core/git-credential-manager.exe"
```

# Use WSL
## Transferring Files From Windows to WSL Easily Using File Explorer
Although you can easily access your Windows files in WSL through the /mnt/c/ directory tree
- Open File Explorer, and in the address bar type `\\wsl$` then press Enter
- ![300](wsl-fileexplorer%201.webp)
- Navigate through the folder tree until you reach your home folder, which will just be your username under home.
- Right-click the folder with your username and click Pin to Quick access
	- ![|100](wsl-quickaccess.png)

## Easy Access to Windows Files from WSL
If you want easy access to Windows user directories in WSL, you can take advantage of Linux’s symbolic links.
Make sure you’re in your home directory.
``` bash
cd
```

Create a directory. Let’s call it “winhome.”
```bash
mkdir winhome
```

Create a symbolic link to your Windows user folder that leads to this new directory.
```bash
ln -s /mnt/c/Users/[Your Username]/ ~/winhome
```

Remember to replace [Your Username] with your Windows username. Listing the winhome directory should show a successful symbolic link now.

If we run a file manager within WSL, we can see the directory tree of our Windows home directory from within the Linux environment.
- https://www.maketecheasier.com/best-file-managers-linux/

# VSCode
## Install WSL Plugin
All you have to do is go to the Extensions Marketplace within VSCode by clicking on the Extensions icon on the left-hand side of the application and search for `wsl`
Just click Install and you’re done!