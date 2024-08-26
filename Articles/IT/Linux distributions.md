#linux #nix #list

# Packet and update system
Если упростить, то дистрибутивы делятся на 3 типа по внутреннему устройству
- deb-based (Debian, Ubuntu, Mint)
	- Dpkg (Debian package manager)
	- Не самое свежее ПО в репозиториях
	- Глобальные обновления выходят по строгому расписанию.
	- Все хорошо тестируется
- rpm-based (Fedora)
	- Всегда свежие программы в репозиториях
	- небольшие проблемы между компонентами у свежего ПО
- arch-based (Arch, Manjaro, Endless OS)
	- Pacman - оф репозитарий
	- Yay - доп репозитарий
	- Всегда самый свежий софт

# Desktop
Различие по средам рабочего стола (desktop environment, DE)
- в стиле **macOS**, это GNOME 
	- Ubuntu
	- Fedora
	- Elementary OS based on Ubuntu
- в стиле **Windows**, это KDE Plasma и Cinnamon (Manjaro, Mint, Kubuntu) 
	- KDE и Cinnamon - имеют тот же привычный набор GUI элементов, схожий функционал, и в целом опыт использования как и у Windows
		- **Mint** родная среда Cinnamon
		- **Manjaro** - KDE
- что-то более экзотическое, например, sway 

# Distributions
- Debian
	- https://www.debian.org/download
	- distributions based on it use the .deb
	- dpkg package manager
	- for Servers
- Kali Linux
	- penetration testing. based on Debian
- Ubuntu
	- https://ubuntu.com/download/desktop
	- 
	- based on Debian
- Linux Mint
	- https://www.linuxmint.com/download.php
	- 2/20Gb
	- based on Debian
	- Desktop
		- Cinnamon - красивый
		- Xfce - для слабых ПК
	- Плюсы
		- Для офиса и работы - прекрасный выбор
	- Минусы
		- не всегда используют самые свежие зависимости
- Manjaro
	- 4/30
	- based on Arch Linux
	- Desktop
		- KDE Plasma, GNOME, Xfce, Cinnamon, Mate
- elementary OS
	- https://elementary.io/docs/installation#installation
	- based on Ubuntu
- Void
	- https://voidlinux.org/download/
	- пакетный менеджер xbps
	- Desktop
		- i3wm
- Tails
	- https://tails.net/install/index.en.html
	- 1(8)/
	- based on Debian
	- Плюсы
		- Для безопасности
		- Все исходящие соединения заворачиваются в сеть Tor, а все неанонимные блокируются
		- Система предназначена для загрузки с LiveCD/LiveUSB и не оставляет следов на машине
- Whonix
	- Безопасная прокси
- Arch Linux
	- Для продвинутых
- Gentoo
	- Для продвинутых