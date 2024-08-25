How to sync Obsidian with Git on Android
# Info
- https://renerocks.ai/blog/obsidian-encrypted-github-android/
- https://gist.github.com/Makeshift/43c7ecb3f1c28a623ea4386552712114

# Prepare
- Software
	- GIT
		- https://git-scm.com/download/win
	- Plugin for Obsidian
		- Obsidian Git
	- ? Gpg4win
		- https://gpg4win.org/download.html
	- git-crypt
		- https://github.com/AGWA/git-crypt
	- termux for Android
		- https://termux.dev/en/
		- https://f-droid.org/packages/com.termux/
	- termux:widget for Android
		- https://wiki.termux.com/wiki/Termux:Widget

## Configure software
### Windows

### Phone
- termux for Android
	- `termux-change-repo`
		- Multiple repo > All Mirrors
	- `pkg install git -y`
	- `termux-setup-storage`
		- Доступ к хранилищу
	- `cd storage/shared`
		- `git config --global credential.helper store`
		- `git config --global user.email "<your_email>"`
		- `git config --global user.name "<commits name>"`
		- `git config --global pull.rebase true`
		- `git clone <your repository>`
		- You may need to create a personal access token if you're using GitHub
			- https://github.com/settings/tokens
- Obsidian on Android
	- Install and open Obsidian
		- https://play.google.com/store/apps/details?id=md.obsidian&hl=en_GB&gl=US
	- Click "Open folder as vault", click on your phone name at the top to navigate to the top directory, and click on your git repository name. Then click "use this folder"
	- With this setup so far, you will need to manually go into the folder in Termux and type git pull. If you'd like to create shortcuts to do this on your homescreen, see this guide
		- `git pull`
		- https://renerocks.ai/blog/obsidian-encrypted-github-android/#shortcuts-for-committing-pushing-and-pulling
	- enable auto-syncing
		- `pkg install cronie termux-services`
		- `exit`
		- `sv-enable crond`
		- `crontab -e`
			- syncs every 30 minutes
			- `*/30 * * * * ~/sync_repo.sh`
			- Click the CTRL button, and type `x`. Type `y` and enter
				- `nano sync_repo.sh`
```bash
#!/bin/bash
cd ~/storage/shared/<your repository name>
git add .
git commit -m "Android Sync $(date)"
git pull
git push
```
- This is a very basic sync and will not handle things like merge conflicts
- Click the CTRL button, and type `x`. Type `y` and enter.
- Run script
	- `chmod +x sync_repo.sh`
- Test your script by running it like so
	- `./sync_repo.sh`