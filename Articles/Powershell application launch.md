#powershell #script
# Info
- https://windowsnotes.ru/powershell-2/zapusk-programmy-iz-powershell/

# Варианты запуска
## Прямой запуск
Самый простой способ запустить исполняемый файл в PowerShell
- `Set-Location ″C:\Program Files″`
- `.\Hello.exe`

## Оператор &
позволяет выполнить строку текста, указанную в кавычках, как единую команду, дополнительные параметры\аргументы передаются также в виде текста, в кавычках.
- `& ′C:\Program Files\Hello.exe′`
- `& ′C:\Program Files\Hello.exe′  ′Hello, world′`
- `& ′C:\Program Files\Hello.exe′  ′Hello,′, ′ world′`
```powershell
$exe = ′C:\Program Files\Hello.exe′
$arg1 = ′Hello′
$arg2 = ′world′
& $exe $arg1 $arg2
```
```powershell
$exe = ′C:\Program Files\Hello.exe′
$allargs = @(′Hello,′,′world′)
& $exe $allargs
```

## Invoke-Expression
Командлет Invoke-Expression работает примерно так-же, как и оператор & — берет текстовую строку и выполняет ее в виде команды. Однако у него есть один большой недостаток, а именно — неумение работать с пробелами.
- `Invoke-Expression -Command ′C:\Windows\Hello.exe′`
- `Invoke-Expression -Command ′C:\Program Files\Hello.exe′`
- `Invoke-Expression -Command ″C:\′Program Files′\Hello.exe″`

## Start-Process
Командлет Start-Process запускает указанный файл в виде процесса, используя метод Start .NET класса Process.
По умолчанию процесс выполняется в отдельном окне, которое закрывается по окончании процесса.
- `Start-Process -FilePath ′C:\Program Files\Hello.exe′`
- `Start-Process -FilePath ′C:\Program Files\Hello.exe′ -NoNewWindow -Wait`
- `Start-Process -FilePath ′C:\Program Files\Hello.exe′ -ArgumentList ′Hello, world′ -NoNewWindow -Wait`
- с помощью параметра -PassThru можно заставить его вернуть объект процесса
	- `$process = Start-Process -FilePath ′C:\Program Files\Hello.exe′ -Wait -PassThru`
	- из которой можно затем можно узнать многие полезные вещи, такие как статус:
		- `$process.HasExited`
		- `$process.ExitTime`
		- `$process.ExitCode`

## CMD
запуск программы из PowerShell — с помощью оболочки cmd
- `cmd /c ″C:\Program Files\Hello.exe″`

## .NET
- `[System.Diagnostics.Process]::Start(′C:\Program Files\Hello.exe′)`
Для примера запустим нашу программу в текущем окне, передадим в нее аргументы и заберем результат выполнения:
```powershell
$process = New-Object -TypeName System.Diagnostics.Process
$process.StartInfo.FileName = ″C:\Program Files\Hello.exe″
$process.StartInfo.Arguments = ″Hello,world″
$process.StartInfo.RedirectStandardOutput = $true
$process.StartInfo.UseShellExecute = $false
$process.Start()
$process.WaitForExit()
$process.StandatdOutput.ReadToEnd()
```

## WMI
- `([wmiclass])″Win32_Process″).Create(′C:\Program Files\Hello.exe′)`
- для выполнения на удаленном компьютере команда будет выглядеть так:
	- `([wmiclass])″\\remotecomputer\root\cimv2:Win32_Process″).Create(′C:\Program Files\Hello.exe′)`
- можно воспользоваться командлетом Invoke-WmiMethod:
	- `Invoke-WmiMethod -Class Win32_Process -Name Create -ArgumentList ″C:\Program Files\Hello.exe″`
- Либо командлетом Invoke-CimMethod:
	- `Invoke-CimMethod -ClassName Win32_Process -MethodName Create -Arguments @{CommandLine=″C:\Program Files\Hello.exe″}`

## Invoke-Command
Есть возможность запуска на нескольких компьютерах
- `Invoke-Command -ScriptBlock {″C:\′Program Files′\Hello.exe″}`
- `Invoke-Command -ScriptBlock {& ′C:\Program Files\Hello.exe′}`
- `Invoke-Command -ScriptBlock {C:\′Program Files′\Hello.exe ″Hello,world″}`
- главное достоинство — это возможность одновременного выполнения на нескольких компьютерах
	- `Invoke-Command -ScriptBlock {″C:\′Program Files′\Hello.exe″} -ComputerName SRV1,SRV2,SRV3`
Запуск на трех ППК
```powershell
$scriptblock = {″C:\′Program Files′\Hello.exe″}
$Computers = @(′SRV1′,′SRV2′,′SRV3′)
Invoke-Command -ScriptBlock $scriptblock -ComputerName $Computers
```

## Invoke-Item
наиболее удобно использовать Invoke-Item для открытия определенного типа файлов
- `Invoke-Item -Path ″C:\Program Files\Hello.exe″`
- `Invoke-Item -Path ″C:\Files\test.txt″`
- `Invoke-Item -Path ″C:\Files\*.txt″`