#mikrotik #cert 

- standard CA certificates
	- Download
		- `/tool fetch url=https://curl.se/ca/cacert.pem`
	- Import
		- `/certificate import file-name=cacert.pem passphrase=""`
- CloudFlare’s HTTPS certificates
	- Download
		- `/tool fetch url=https://cacerts.digicert.com/DigiCertGlobalRootG2.crt.pem`
	- Import
		- `/certificate import file-name=DigiCertGlobalRootG2.crt.pem passphrase=""`
- 21
	- Download
	- Import