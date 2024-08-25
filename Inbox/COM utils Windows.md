#harware 
Info
- https://kompyuter-gid.ru/sistema/nastrojka-com-porta-windows-10.html

Utils
- Serial Port Notifier 
	- https://sourceforge.net/projects/serial-port-monitor/
	- Usage
		- https://www.tomshardware.com/how-to/detect-com-port-windows-serial-port-notifier
- HDD Device Monitoring Studio
	- https://www.hhdsoftware.com/device-monitoring-studio
	- https://slavshkola.ru/blog/kak-opredelit-nomer-com-porta-ustrojstva
- Удалить используемые COM-порты в Windows
	-  Win + R > devmgmt.msc > OK) и выберите в меню «Просмотр» > «Показать скрытые устройства»
	- Сбросить COM-порты с помощью редактора реестра
		- Нажмите Win + R на клавиатуре. Введите команду regedit, чтобы запустить редактор реестра;Перейдите по следующему пути: 
		- Компьютер`\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\COM Name Arbiter`. Если вы используете Windows 10, просто скопируйте путь и вставьте его в поле адреса;
		- В левой части окна щелкните правой кнопкой мыши Арбитр имени 
		- COM и выберите Экспорт. Сохраните экспорт в файл com_name_arbiter_bak.reg где-нибудь, где вы сможете легко получить к нему доступ, если что-то пойдет не так. В экстренных случаях это поможет восстановить прежние рабочие настройки;
		- Если вы хотите сбросить все COM-порты, измените значение ComDB на 0. Двоичное значение ComDB определяет список зарезервированных COM-портов. Каждый бит определяет состояние соответствующего порта (от 1 до 255);
		- Вы также можете найти список всех назначенных COM-портов в папке `Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Ports`. Вы можете удалить все порты, которые хотите освободить;
		- Перезагрузите компьютер. Когда он снова загрузится, подключите все устройства в правильном порядке.
	- COM Name Arbiter Tool
	- DevCon
		- с помощью утилиты DevCon, встроенной в набор драйверов Windows (WDK), Visual Studio и Windows SDK для настольных приложений.
- Как проверить, какая программа использует последовательный (COM) порт
	- Sysinternals Process Explorer 
		- Откройте Диспетчер устройств, разверните Порты (COM и LPT), щелкните правой кнопкой мыши COM-порт, который хотите проверить, и выберите Свойства.
		- Перейдите на вкладку "Сведения", выберите "Сервис" в раскрывающемся списке "Ресурс";
		- Скопируйте значение службы, на которое ссылается ваш COM-порт. В нашем примере это Serial;
		- В меню Process Explorer выберите меню Find > Find Handle или DLL (или просто нажмите Ctrl+F на клавиатуре); 
		- В поле поиска дескриптора или подстроки DLL введите имя службы, которая использует ваш COM-порт. В нашем примере это серийный номер. Нажмите "Поиск";
		- Process Explorer вернет список процессов, использующих ваш COM-порт. В нашем примере это процесс putty.exe с идентификатором процесса 5380; 
- Virtual COM
	- https://www.virtual-serial-port.org/user-guides/standard/installation.html