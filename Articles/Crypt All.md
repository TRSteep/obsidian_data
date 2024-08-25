<<<<<<< HEAD
#crypt #app #software 
=======
#crypt
>>>>>>> f7fc09926f4955998d32623ae7f435fd4becc1d7
- ### Drive
	- VeraCrypt #veracrypt
		- https://www.veracrypt.fr/code/VeraCrypt/
		- AES + Whirlpool или RIPEMD-160 + PIN > 1000
	- zuluCrypt on linux
		- является графическим интерфейсом для работы с cryptsetup
- ### Folders
	- Cryptomator
		- https://cryptomator.org/
		- chmod +x Cryptomator-1.5.8-x86_64.AppImage
			- ./Cryptomator-1.5.8-x86_64.AppImage
<<<<<<< HEAD
		- можно открыть в sirikali на linux
	- **SiriKali** 
=======
	- SiriKali 
>>>>>>> f7fc09926f4955998d32623ae7f435fd4becc1d7
		-  https://github.com/mhogomchungu/sirikali/releases
		- ~~encfs (WinFsp)
			- https://github.com/billziss-gh/winfsp
			- https://github.com/mhogomchungu/encfs/releases
			- в 2014 году в EncFS были найдены уязвимости
			- Проект не обновлялся с 2018 года - устарел
		- **Securefs** on WinFsp
			- https://winfsp.dev/rel/
			- https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist?view=msvc-170#visual-studio-2015-2017-2019-and-2022
			- https://github.com/netheril96/securefs/releases
<<<<<<< HEAD
				- last version 2023.08
=======
>>>>>>> f7fc09926f4955998d32623ae7f435fd4becc1d7
			- Efficient cloud synchronization
			- Authenticated and Probabilistic encryption 
		- **cppcryptfs** (based on gocryptfs) on dokany 2.0
			- вроде как наиболее быстрый
			- https://github.com/dokan-dev/dokany/releases
<<<<<<< HEAD
				- last version 2023.12
			- https://github.com/bailey27/cppcryptfs/releases
				- last version 2023.09
				- необходимо скопировать в папку и добавить в set executable search path
=======
			- https://github.com/bailey27/cppcryptfs/releases
>>>>>>> f7fc09926f4955998d32623ae7f435fd4becc1d7
			- `sudo apt-get install gocryptfs`
				- gocryptfs -init ~/cipher
				- gocryptfs ~/cipher ~/mount
		- **CryFS** on dokany 2.0
			- специализирована для облака - дробит файлы на шифрованные блоки. скрывает метаданные и структуру каталогов. AES-256
			- из минусов: множество отдельных файлов и бета версия
			- https://github.com/dokan-dev/dokany/releases
<<<<<<< HEAD
				- last version 2023.07
			- https://www.cryfs.org/#download
			- `sudo apt-get install cryfs`
				- cryfs basedir mountdir
		- sshfs - OLD
			- https://github.com/winfsp/sshfs-win/releases
				- last version 2021.02
=======
			- https://www.cryfs.org/#download
			- `sudo apt-get install cryfs`
				- cryfs basedir mountdir
>>>>>>> f7fc09926f4955998d32623ae7f435fd4becc1d7
- ### Cloud
	- rclone
		- https://rclone.org/downloads/
		- RClone подключается к облакам напрямую.
			- файлы шифруются перед загрузкой в облако, а на компьютере хранятся в расшифрованном виде
		- rclone config
			- name
			- n) New remote
			- Dropbox
				- https://www.dropbox.com/developers/apps/create
				- 13
				- client_id - null
				- client_secret - null
				- auto config - y
				- token
		- Autostart
			- `c:\rclone\rclone.exe sync c:\files remote:/files --no-console --log-file c:\rclone\logs\sync_files.txt`
- ### BackUp
	- Duplicati
		- https://www.duplicati.com/download
- ### Files
	- Picocrypt
		- https://github.com/HACKERALERT/Picocrypt
	- Kryptor
		- https://www.kryptor.co.uk/
		- консольная современная альтернатива GPG
- Passwords
	- KeePass
	- KeePassXC
		- https://keepassxc.org/
- ### Notes
	- Joplin
		- Штатно шифрует файлы и синхронизиация шифрованных файлов через DropBox, корректно работает с Android
	- turtlapp.com