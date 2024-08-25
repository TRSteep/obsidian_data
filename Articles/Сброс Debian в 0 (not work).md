# Clean
- sudo apt-get update
- sudo apt-get -f install
- sudo apt-get full-upgrade
- apt --fix-broken install
- sudo apt-get autoremove
- sudo apt-get clean


# Resetter (не обновлялась)
- Инструкция
	- https://g-soft.info/articles/3310/kak-sbrosit-ubuntu/
- посмотреть последнюю версию на странице
	- https://github.com/gaining/Resetter/releases
- скачать
	- `cd ~/`
	- `mkdir resetter`
	- `wget https://github.com/gaining/Resetter/releases/download/v3.0.0-stable/resetter_3.0.0-stable_all.deb`
- установка
	- `sudo dpkg -i resetter_3.0.0-stable_all.deb`
	- `sudo apt-get -f install`
	- `sudo resetter`
