#cert
# Online
## Online convertor
- https://www.sslshopper.com/ssl-converter.html

# Linux
## debian
- `apt install openssl`
- convert pfx to pem
	- `openssl pkcs12 -in so-ups.ru.pfx -legacy -nodes -out so-ups.ru.pem`

---
# NOT WORK
## Win32OpenSSL
- https://slproweb.com/products/Win32OpenSSL.html
	- https://slproweb.com/download/Win64OpenSSL-3_1_2.msi
- cmd
	- `set OPENSSL_CONF=C:\Program Files\OpenSSL-Win64\bin\openssl.cfg`
	- `set Path=%Path%;C:\Program Files\OpenSSL-Win64\bin`
	- `sysdm.cpl`
		- OPENSSL_CONF
			- `C:\Program Files\OpenSSL-Win64\bin\openssl.cfg`
		- Path
			- `C:\Program Files\OpenSSL-Win64\bin\`
- convert
	- `openssl pkcs12 -in <filename>.pfx -nocerts -out key.pem`


## OpenSSL
- https://github.com/szeidat/OpenSSL/releases
- extract the zip file to the user's PowerShell modules folder
	- `%USERPROFILE%\Documents\WindowsPowerShell\Modules\OpenSSL`
	- or
	- `%USERPROFILE%\Documents\WindowsPowerShell\Modules\OpenSSL`
- Install in PowerShell
	- `Install-Module -Name OpenSSL -Scope CurrentUser`
	- or
	- `Install-Module -Name OpenSSL -Scope AllUsers`
		- `Install-Module -Name OpenSSL -Scope AllUsers -AllowClobber`
- Convert in PowerShell
	- `openssl pkcs12 -in <filename>.pfx -nocerts -out key.pem`