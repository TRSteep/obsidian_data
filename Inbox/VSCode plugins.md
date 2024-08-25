#dev 

- ### Projects
	- Project Manager 
- ### Git
	- GitLens
	- Git Project Manager
	- Git Graph - Для отображения веток в виде графа
	- Git History - Для удобного просмотра истории
- ### Remote
	- Remote - SSH подключение к удаленному серверу
	- Remote Explorer
	- SFTP добавляет возможность в проектах добавлять SFTP конфиг, в котором можно указать опции синхронизации
- Python
	- Python
	- Jyniper
- ### Arduino
	- Arduino
	- PlatformIO IDE
	- Serial Monitor
- Docker
	- Microsoft Docker
- 3D Print
	- Auto Build Marlin
- ### HTML, XML
	- Auto Complete Tag
	- CSS Intellisense for HTML
- СУБД 
	- SQLTools
- Разметка, подсветка
	- Spelling Checker
	- markdownlint - Markdown
	- CSV
		- Rainbow CSV
		- Edit CSV - просмотр и редактирвоание CSV
	- PowerShell
	- Cisco IOS Syntax\
	- XML от RedHat
	- JSON Tools
	- SQL Formatter
	- Regex Previewer - быстрая отладка регулярных выражений прямо в VSCode.
- Todo
	- Todo Tree
	- YouTrack Issues
	- Redmine
	- Jira and Bitbucket 
	- YouTrack
- Theme
	- Dracula
	- Twilight Theme
	- GitHub Theme
	- Addon
		- Total Lines - добавляет в тулбар информацию, о количестве строк в файле.
		- Bookmarks - для удобных флажков на строчки кода
		- Better Comments - кастомизация комментариев в коде
		- Hungry Delete - быстрое удаление пустых строк и пробелов одним нажатием.
		- Path Intellisense - автоподставление путей к файлам.

---
### Настройка SFTP / FTP
- ctrl + shift + P, в строке ввести SFTP: Config
```json
{
    "name": "Connection Name", // Название соединения
    "host": "test.ru", // Адрес сервера
    "interactiveAuth": true, // Чтобы работал 2fa (DUO, Мультифактор и т.п.)
    "protocol": "sftp", // Протокол подключения к серверу
    "port": 22, // Порт подключения к серверу
    "username": "user", // Имя пользователя, под которым подключаемся
    "privateKeyPath": "/Users/user/.ssh/id_rsa", // Путь к приватному SSH ключу на ПК
    "remotePath": "/var/www/html", // Каталог, который нужно синхронизировать
    "downloadOnOpen": true, // Скачивать файл с сервера при открытии
    "uploadOnSave": true, // Загружать файл на сервер при сохранении
    "ignore": [ // Список файлов и папок, которые нужно исключить из синхронизации
        ".vscode",
        ".idea",
        ".git",
        ".DS_Store",
        "var"
    ],
    "remoteExplorer": { // Список файлов и папок, которые нужно исключить из визора файлов на сервере
        "filesExclude": [
            "/var"
        ]
    }
}
```

### Настройка SQLTool 
- ctrl+shift+P, в строке ввести SQLTool
-  MySQL
```json
{
    "sqltools.connections": [
        {
            "mysqlOptions": {
                "authProtocol": "default"
            },
            "previewLimit": 50, // Количество строк в превью
            "server": "test.ru", // Адрес сервера СУБД
            "port": 3306, // Порт СУБД
            "driver": "MySQL", // Драйвер 
            "name": "ConnactionName", // Имя подключения в визоре
            "database": "testdb", // Имя БД
            "username": "user", // Пользователь БД
            "connectionTimeout": 60, // Тайм-аут подключения в секундах
            "password": "db_password" // Пароль пользователя БД
        }
    ]
}
```