#windows #software 

# Chocolatey
## Info
- https://chocolatey.org/
- https://community.chocolatey.org/

## Requirements
- Windows
	- Client
		- Windows 11
		- Windows 10 22H2
		- Windows 10 21H2
	- Server
		- Windows Server 2022
		- Windows Server 2019
		- Windows Server 2016
- PowerShell v2+
- .NET Framework 4.8

## Install
- https://docs.chocolatey.org/en-us/choco/setup/
- Offline install
	- https://docs.chocolatey.org/en-us/choco/setup/#completely-offline-install
	- https://community.chocolatey.org/packages/chocolatey
- Online install
	- Run cli at Admin user

### CMD
```cmd
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
```

### PowerShell
```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```