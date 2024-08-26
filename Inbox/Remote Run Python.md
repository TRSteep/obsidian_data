#python #dev 

# Pycharm
## Подготовительная настройка
- Create folder
	- `C:\Media\PythonWrapper`
- Скачиваем туда
	- plink.exe и pscp.exe
	- https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html
- Создаем symlink powershell с именем питона (т.к. Pycharm использует только такое название)
	- `cd C:\Media\PythonWrapper`
```python
cmd.exe /c mklink python.exe C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe
```
- Создаем скрипт для загрузки проекта на сервер
	- `deploy.ps1`
```powershell
C:\Media\PythonWrapper\plink -ssh debian@13.13.13.36 -pw debian 'rm -rf '$args[1]';mkdir -p '$args[1]
$dpath = 'debian@13.13.13.36:~/' + $args[1] + '/'
C:\Media\PythonWrapper\pscp -r -scp -pw debian $args[0] $dpath
```
- Создаем скрипт передачи и запуска кода на сервере
	- python.ps1
	- Где testProject — название будущего проекта.
```powershell
cat $args[0] | C:\Media\PythonWrapper\plink -ssh debian@13.13.13.36 -pw debian 'cd testProject/testProject;python3 -'
```

## Настройки IDE PyCharm
- File->Settings или Ctrl-Alt-S
	- Во вкладке проекта — Project Interpreter. Нажимаем Add Local:
		- ![|500](f6ba9357d05d4004b99bf7b7eefe64d4.png)
		- Добавляем:
			- ![|300](ba4799f0d8b34ac6852973fbbeff1cde.png)
		- IDE ругается, но добавляет в список. Нажмем «More..» и переименуем в wrapper:
	- Лучше вернуть Project Interpreter обратно на версию 3.2 (у меня стоит 3.4), иначе отвалятся подсказки и автодополнение.

